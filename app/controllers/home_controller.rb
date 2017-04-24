class HomeController < ApplicationController
  require 'json'
  require 'google_calendar'
  require 'uri'
  require 'net/http'
  require 'open-uri'
  include GoogleCalendar

  def index

  end

  def req_post
    # result = open('https://httpbin.org/get')
    # response = result.read.to_s
    # puts response
    uri = URI('https://httpbin.org/post')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(uri.path)

    request["HEADER1"] = 'VALUE1'
    request["HEADER2"] = 'VALUE2'

    response = https.request(request)
    puts response.body

    render :text => response.body
  end

  def fetch
    render :json => fetchJson
  end

  def ask_permission

  end

  def permission_action
    render :text => permission(params[:q])
  end

  def calendar_action
    mode = params["!nativeeditor_status"]
    id = params["id"]
    start_date = params["start_date"]
    end_date = params["end_date"]
    text = params["text"]

    case mode
      when "inserted"
        event = {}
        event[:summary] ||= {}
        event[:summary] =  text
        isoStartDate = start_date.to_time.iso8601
        isoEndDate = end_date.to_time.iso8601
        event[:start] ||= {}
        event[:start][:date_time] ||= {}
        event[:start][:date_time] = isoStartDate
        event[:end] ||= {}
        event[:end][:date_time] ||= {}
        event[:end][:date_time] = isoEndDate
        puts event.to_hash
        insertJson(event.to_hash)
    end

    render :json => {
        :type => mode,
        :sid => id,
    }
  end

  def data
    events = CalendarEvent.all

    render :json => events.map {|event| {
        :id => event.id,
        :start_date => event.start_date.to_formatted_s(:db),
        :end_date => event.end_date.to_formatted_s(:db),
        :text => event.text
    }}
  end


  def db_action
    mode = params["!nativeeditor_status"]
    id = params["id"]
    start_date = params["start_date"]
    end_date = params["end_date"]
    text = params["text"]

    case mode
      when "inserted"
        event = CalendarEvent.create :start_date => start_date, :end_date => end_date, :text => text
        tid = event.id

      when "deleted"
        CalendarEvent.find(id).destroy
        tid = id

      when "updated"
        event = CalendarEvent.find(id)
        event.start_date = start_date
        event.end_date = end_date
        event.text = text
        event.save
        tid = id
    end

    render :json => {
        :type => mode,
        :sid => id,
        :tid => tid,
    }
  end
end
