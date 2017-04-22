module GoogleCalendar
  def helloWorld
    puts "hello world"
  end

  require 'google/apis/calendar_v3'
  require 'googleauth'
  require 'googleauth/stores/file_token_store'

  require 'fileutils'
  require 'certified'
  require 'json'

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                               "calendar-ruby-quickstart.yaml")
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
  def authorize
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
        client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(
          base_url: OOB_URI)
      puts "Open the following URL in the browser and enter the " +
               "resulting code after authorization"
      puts url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI)
    end
    credentials
  end

  def fetchJson()
    # Initialize the API
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize

    # Fetch the next 10 events for the user
    calendar_id = 'bimawansatrianto@gmail.com'
    response = service.list_events(calendar_id,
                                   max_results: 10,
                                   single_events: true,
                                   order_by: 'startTime',
                                   time_min: Time.now.iso8601)
    puts "Wawawaw"
    puts (response.to_json)
    myjson ||= []
    tempjson = {}
    puts "No upcoming events found" if response.items.empty?
    response.items.each do |event|
      # tempjson["id"] ||= {}
      # tempjson["id"] = id
      tempjson["text"] ||= {}
      tempjson["text"] = "#{event.summary}"

      startDate = Date.strptime("#{event.start.date_time}", '%FT%T%:z').strftime("%Y-%m-%d %T")
      endDate = Date.strptime("#{event.end.date_time}", '%FT%T%:z').strftime("%Y-%m-%d %T")

      tempjson["start_date"] ||= {}
      tempjson["start_date"] = startDate
      tempjson["end_date"] ||= {}
      tempjson["end_date"] = endDate
      myjson << tempjson.clone
      puts JSON.dump(tempjson)
      puts "*****************************"
      puts JSON.dump(myjson)
      puts "*****************************"
    end

    puts "============================="
    puts "============================="
    puts "============================="
    puts JSON.dump(myjson)
    # File.open("public/jadwal.json", 'w') {
    #     |file| file.write( JSON.dump(myjson))
    # }

    @result = JSON.dump(myjson)
  end

  def insertJson(json)
    # Initialize the API
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize

    puts "json wawawawawa"
    puts json
    ev = Google::Apis::CalendarV3::Event.new(json)
    service.insert_event('primary', ev)
    puts "Event created"
  end

  def insertEvent(summary, starttime, endtime)
    event = {}
    event["summary"] ||= {}
    event["summary"] =  summary
    isoStartDate = starttime.to_time.iso8601
    isoEndDate = endtime.to_time.iso8601
    event["start"] ||= {}
    event["start"]["date_time"] ||= {}
    event["start"]["date_time"] = isoStartDate
    event["end"] ||= {}
    event["end"]["date_time"] ||= {}
    event["end"]["date_time"] = isoEndDate

    insertJson(JSON.dump(event))
  end
end