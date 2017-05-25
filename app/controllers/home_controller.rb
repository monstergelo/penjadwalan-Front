
class HomeController < ApplicationController
  require 'json'
  require 'google_calendar'
  require 'uri'
  require 'net/http'
  require 'open-uri'
  include GoogleCalendar

  def index

  end

  def schedule

  end

  def periode

  end

  def req_post
    # result = open('https://httpbin.org/get')
    # response = result.read.to_s
    # puts response
    uri = URI('http://ppl-scheduling.herokuapp.com/ppl-scheduling/api/v1/scheduler/')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = false

    request = Net::HTTP::Post.new(uri.path)

    request["HEADER1"] = 'VALUE1'
    request["HEADER2"] = 'VALUE2'

    response = https.request(request)
    puts response.body

    data = JSON.parse(response.body)["result"]

    render :text => JSON.dump(data)
  end

  def fetch()
    render :json => fetchUserJson('ikhwan.m1996@gmail.com')
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
        event[:reminder] ||= {}
        event[:reminder][:use_default] ||= {}
        event[:reminder][:use_default] = false
        event[:reminder][:overrides] ||= []
        reminder = {}
        reminder[:method] ||= {}
        reminder[:minutes] ||= {}
        reminder[:method] = "email"
        reminder[:minutes] = 15
        event[:reminder][:overrides] << reminder.clone
        reminder[:method] = "popup"
        reminder[:minutes] = 15
        event[:reminder][:overrides] << reminder.clone

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

  def login

  end

  def get_email
    $email = params[:email]
    #do your stuff with comments_from_form here
    ret = fetchUserJson($email)
    #Open view calendar
    if ret != false then
      system("explorer http://127.0.0.1:3000/home/index")
    end
  end

  def get_code
    code = params[:code]
    authorize_by_code($email, code)
  end

  def redirect
    client = Signet::OAuth2::Client.new({
                                            client_id: Rails.application.secrets.google_client_id,
                                            client_secret: Rails.application.secrets.google_client_secret,
                                            authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
                                            scope: ["profile", "email", Google::Apis::CalendarV3::AUTH_CALENDAR, Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY],
                                            access_type: 'offline',
                                            redirect_uri:'http://localhost:3000/auth/google_oauth2/callback'
                                        })

    redirect_to client.authorization_uri.to_s
  end

  def get_periode
    date_start = params[:date_start]
    date_end = params[:date_end]
    # make JSON
    jsonPeriod = {}
    myjson = {
        "start" => date_start,
        "end" => date_end
    }
    jsonPeriod[:periode] ||={}
    jsonPeriod[:periode] = myjson

    puts JSON.dump(jsonPeriod)
    # sendPOST('http://ppl-scheduling.herokuapp.com/periode', JSON.dump(jsonPeriod))
  end
end
