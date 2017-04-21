class HomeController < ApplicationController
  require 'json'

  def index

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
