class HomeController < ApplicationController
  protect_from_forgery prepend: true
  skip_before_filter  :verify_authenticity_token
  # skip_before_action :authenticate_user!, :only => [:login, :get_code, :get_email], :raise=>false
  require 'json'
  require 'google_calendar'
  require 'uri'
  require 'net/http'
  require 'open-uri'
  include GoogleCalendar

  def index

  end

  def kerja_praktik

  end

  def seminar_satu

  end

  def seminar_dua

  end

  def sidang

  end

  def schedule

  end

  def test_calendar_process

  end

  def tambah_mahasiswa

  end
  def test_request
    @result = JSON.parse(req_post)
    @myjson ||= []
    @tempjson = {}
    i = 0
    @result.each do |event|
      # i = i+1
      # break if i > 1

      @tempjson["text"] ||= {}
      @tempjson["text"] = event["studentID"]

      startDate = Time.at(Time.parse(event["start"]).to_i)
      endDate = Time.at(Time.parse(event["end"]).to_i)

      puts "################"


      @tempjson["start_date"] ||= {}
      @tempjson["start_date"] = startDate
      # puts @tempjson["start_date"]
      # puts startDate
      @tempjson["end_date"] ||= {}
      @tempjson["end_date"] = endDate
      @myjson << @tempjson.clone
      # puts JSON.dump(@tempjson)
    end

    # puts "*****************************"
    # puts JSON.dump(@myjson)
    # puts "*****************************"

    render :text => JSON.dump(@myjson)
  end


  #getting result from server##########################################################################
  def req_post_form

  end

  def result_calendar()

  end

  def receive_json_result()
    @result = JSON.parse(send_json_post())
    # puts @result
    @myjson ||= []
    @tempjson = {}
    i = 0
    @result.each do |event|
      # i = i+1
      # break if i > 1

      @tempjson["text"] ||= {}
      @tempjson["text"] = event["studentID"]

      startDate = Time.at(Time.parse(event["start"]).to_i)
      endDate = Time.at(Time.parse(event["end"]).to_i)

      puts "################"


      @tempjson["start_date"] ||= {}
      @tempjson["start_date"] = startDate
      # puts @tempjson["start_date"]
      # puts startDate
      @tempjson["end_date"] ||= {}
      @tempjson["end_date"] = endDate
      @myjson << @tempjson.clone
      # puts JSON.dump(@tempjson)
    end

    # puts "*****************************"
    # puts JSON.dump(@myjson)
    # puts "*****************************"

    render :text => JSON.dump(@myjson)
  end

  def send_json_post
    uri = URI('http://ppl-scheduling.herokuapp.com/ppl-scheduling/api/v1/scheduler/')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = false

    request = Net::HTTP::Post.new(uri.path)

    request["Content-Type"] = "application/json"

    response = https.request(request)
    # puts response.body

    base_uri = 'https://ppl-scheduling.firebaseio.com/'

    firebase = Firebase::Client.new(base_uri)

    response = firebase.get("result")
    #puts response.body
    response.success? # => true
    response.code # => 200
    response.body # => { 'name' => "-INOQPH-aV_psbk3ZXEX" }
    response.raw_body # => '{"name":"-INOQPH-aV_psbk3ZXEX"}'

    data = response.body

    return data.to_json
    #render :template => "home/result_calendar", :data => JSON.dump(data)
    #redirect_to result_calendar_path(JSON.dump(data))

  end
  ##############################################################################################
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

    request["Content-Type"] = "application/json"


    request.body = "{
	\"data\": {
  \"listStudent\": [
    {
      \"studentID\": \"59073\",
      \"name\": {
        \"first\": \"Janie\",
        \"last\": \"Mccray\"
      },
      \"email\": \"janie.mccray@undefined.ca\",
      \"topics\": [
        \"Graphic\"
      ],
      \"pembimbingID\": [
        \"59073d2be2558e6856de942e\"
      ],
      \"pengujiID\": [
        \"59073d2a3fe3b52b1463b58d\"
      ]
    },
    {
      \"studentID\": \"905fa\",
      \"name\": {
        \"first\": \"Tonya\",
        \"last\": \"Rhodes\"
      },
      \"email\": \"tonya.rhodes@undefined.us\",
      \"topics\": [
        \"Graphic\",
        \"Graphic\"
      ],
      \"pembimbingID\": [
        \"59073d2a0d00b4d9bff85737\"
      ],
      \"pengujiID\": [
        \"59073d2a3fe3b52b1463b58d\",
        \"59073d2a0d00b4d9bff85737\"
      ]
    },
    {
      \"studentID\": \"0a7f4\",
      \"name\": {
        \"first\": \"Short\",
        \"last\": \"Chase\"
      },
      \"email\": \"short.chase@undefined.io\",
      \"topics\": [
        \"Machine Learning\",
        \"Machine Learning\"
      ],
      \"pembimbingID\": [
        \"59073d2be2558e6856de942e\",
        \"59073d2a3fe3b52b1463b58d\"
      ],
      \"pengujiID\": [
        \"59073d2a3fe3b52b1463b58d\",
        \"59073d2aef6a0c0380745010\"
      ]
    },
    {
      \"studentID\": \"4bdbd\",
      \"name\": {
        \"first\": \"Eleanor\",
        \"last\": \"Riggs\"
      },
      \"email\": \"eleanor.riggs@undefined.name\",
      \"topics\": [
        \"Network\"
      ],
      \"pembimbingID\": [
        \"59073d2aef6a0c0380745010\"
      ],
      \"pengujiID\": [
        \"59073d2aef6a0c0380745010\",
        \"59073d2aef6a0c0380745010\"
      ]
    },
    {
      \"studentID\": \"91699\",
      \"name\": {
        \"first\": \"Sophie\",
        \"last\": \"Dominguez\"
      },
      \"email\": \"sophie.dominguez@undefined.me\",
      \"topics\": [
        \"AI\",
        \"Network\"
      ],
      \"pembimbingID\": [
        \"59073d2b159da9f6ff94372e\"
      ],
      \"pengujiID\": [
        \"59073d2b159da9f6ff94372e\",
        \"59073d2be2558e6856de942e\"
      ]
    },
    {
      \"studentID\": \"6baeb\",
      \"name\": {
        \"first\": \"Casey\",
        \"last\": \"Gonzalez\"
      },
      \"email\": \"casey.gonzalez@undefined.org\",
      \"topics\": [
        \"Encryption\"
      ],
      \"pembimbingID\": [
        \"59073d2aef6a0c0380745010\",
        \"59073d2b159da9f6ff94372e\"
      ],
      \"pengujiID\": [
        \"59073d2a3fe3b52b1463b58d\"
      ]
    },
    {
      \"studentID\": \"8afbe\",
      \"name\": {
        \"first\": \"Alyce\",
        \"last\": \"Wong\"
      },
      \"email\": \"alyce.wong@undefined.com\",
      \"topics\": [
        \"Graphic\"
      ],
      \"pembimbingID\": [
        \"59073d2be2558e6856de942e\",
        \"59073d2a0d00b4d9bff85737\"
      ],
      \"pengujiID\": [
        \"59073d2b159da9f6ff94372e\"
      ]
    },
    {
      \"studentID\": \"aaf8a\",
      \"name\": {
        \"first\": \"Tammy\",
        \"last\": \"Dawson\"
      },
      \"email\": \"tammy.dawson@undefined.biz\",
      \"topics\": [
        \"Encryption\"
      ],
      \"pembimbingID\": [
        \"59073d2b159da9f6ff94372e\"
      ],
      \"pengujiID\": [
        \"59073d2be2558e6856de942e\",
        \"59073d2a0d00b4d9bff85737\"
      ]
    },
    {
      \"studentID\": \"09042\",
      \"name\": {
        \"first\": \"Gamble\",
        \"last\": \"Dillon\"
      },
      \"email\": \"gamble.dillon@undefined.net\",
      \"topics\": [
        \"Graphic\",
        \"Encryption\"
      ],
      \"pembimbingID\": [
        \"59073d2a0d00b4d9bff85737\",
        \"59073d2aef6a0c0380745010\"
      ],
      \"pengujiID\": [
        \"59073d2a0d00b4d9bff85737\"
      ]
    },
    {
      \"studentID\": \"i19ab\",
      \"name\": {
        \"first\": \"Dora\",
        \"last\": \"Hood\"
      },
      \"email\": \"dora.hood@undefined.tv\",
      \"topics\": [
        \"Encryption\",
        \"Satabase\"
      ],
      \"pembimbingID\": [
        \"59073d2aef6a0c0380745010\",
        \"59073d2b159da9f6ff94372e\"
      ],
      \"pengujiID\": [
        \"59073d2a0d00b4d9bff85737\",
        \"59073d2be2558e6856de942e\"
      ]
    },
    {
      \"studentID\": \"17c80\",
      \"name\": {
        \"first\": \"Shelia\",
        \"last\": \"Wiggins\"
      },
      \"email\": \"shelia.wiggins@undefined.info\",
      \"topics\": [
        \"Network\"
      ],
      \"pembimbingID\": [
        \"59073d2a3fe3b52b1463b58d\",
        \"59073d2a3fe3b52b1463b58d\"
      ],
      \"pengujiID\": [
        \"59073d2b159da9f6ff94372e\",
        \"59073d2b159da9f6ff94372e\"
      ]
    },
    {
      \"studentID\": \"o559b\",
      \"name\": {
        \"first\": \"Laurel\",
        \"last\": \"Duran\"
      },
      \"email\": \"laurel.duran@undefined.co.uk\",
      \"topics\": [
        \"Satabase\",
        \"Encryption\"
      ],
      \"pembimbingID\": [
        \"59073d2be2558e6856de942e\",
        \"59073d2b159da9f6ff94372e\"
      ],
      \"pengujiID\": [
        \"59073d2a0d00b4d9bff85737\"
      ]
    }
  ],
  \"listLecturer\": [
    {
      \"lecturerID\": \"59073d2a3fe3b52b1463b58d\",
      \"name\": {
        \"first\": \"Salinas\",
        \"last\": \"Kidd\"
      },
      \"email\": \"salinas.kidd@undefined.com\",
      \"topics\": [
        \"Network\",
        \"Satabase\"
      ],
      \"events\": [
        {
          \"start\": \"2017-05-06 08:40:17\",
          \"end\": \"2017-05-12 04:13:42\"
        },
        {
          \"start\": \"2017-05-17 07:53:24\",
          \"end\": \"2017-05-11 09:18:26\"
        },
        {
          \"start\": \"2017-05-05 05:34:40\",
          \"end\": \"2017-05-14 09:09:49\"
        },
        {
          \"start\": \"2017-05-10 10:52:21\",
          \"end\": \"2017-05-02 03:00:55\"
        },
        {
          \"start\": \"2017-05-09 10:15:38\",
          \"end\": \"2017-05-15 12:26:45\"
        }
      ]
    },
    {
      \"lecturerID\": \"59073d2aef6a0c0380745010\",
      \"name\": {
        \"first\": \"Krystal\",
        \"last\": \"Monroe\"
      },
      \"email\": \"krystal.monroe@undefined.us\",
      \"topics\": [
        \"Satabase\",
        \"Graphic\"
      ],
      \"events\": [
        {
          \"start\": \"2017-05-08 07:47:22\",
          \"end\": \"2017-05-14 11:05:32\"
        },
        {
          \"start\": \"2017-05-07 02:25:43\",
          \"end\": \"2017-05-08 09:29:27\"
        },
        {
          \"start\": \"2017-05-19 04:36:53\",
          \"end\": \"2017-05-15 03:23:57\"
        },
        {
          \"start\": \"2017-05-08 02:33:45\",
          \"end\": \"2017-05-15 02:17:56\"
        },
        {
          \"start\": \"2017-05-15 07:40:10\",
          \"end\": \"2017-05-16 05:34:58\"
        },
        {
          \"start\": \"2017-05-09 07:00:39\",
          \"end\": \"2017-05-07 01:58:06\"
        },
        {
          \"start\": \"2017-05-07 04:34:07\",
          \"end\": \"2017-05-13 08:09:28\"
        },
        {
          \"start\": \"2017-05-05 05:31:22\",
          \"end\": \"2017-05-11 07:49:47\"
        }
      ]
    },
    {
      \"lecturerID\": \"59073d2a0d00b4d9bff85737\",
      \"name\": {
        \"first\": \"Hopper\",
        \"last\": \"Kelley\"
      },
      \"email\": \"hopper.kelley@undefined.net\",
      \"topics\": [
        \"Machine Learning\",
        \"Satabase\",
        \"AI\"
      ],
      \"events\": [
        {
          \"start\": \"2017-05-09 08:59:22\",
          \"end\": \"2017-05-06 01:29:24\"
        },
        {
          \"start\": \"2017-05-10 10:52:55\",
          \"end\": \"2017-05-06 02:11:36\"
        },
        {
          \"start\": \"2017-05-15 08:08:47\",
          \"end\": \"2017-05-05 04:42:56\"
        },
        {
          \"start\": \"2017-05-08 01:23:19\",
          \"end\": \"2017-05-02 04:19:15\"
        },
        {
          \"start\": \"2017-05-05 07:33:09\",
          \"end\": \"2017-05-06 08:12:11\"
        },
        {
          \"start\": \"2017-05-03 07:17:27\",
          \"end\": \"2017-05-13 06:59:27\"
        }
      ]
    },
    {
      \"lecturerID\": \"59073d2b159da9f6ff94372e\",
      \"name\": {
        \"first\": \"Gwendolyn\",
        \"last\": \"Duffy\"
      },
      \"email\": \"gwendolyn.duffy@undefined.me\",
      \"topics\": [
        \"Graphic\",
        \"AI\",
        \"Graphic\"
      ],
      \"events\": [
        {
          \"start\": \"2017-05-05 07:09:48\",
          \"end\": \"2017-05-07 12:30:11\"
        },
        {
          \"start\": \"2017-05-15 04:48:33\",
          \"end\": \"2017-05-10 06:21:01\"
        },
        {
          \"start\": \"2017-05-19 05:50:53\",
          \"end\": \"2017-05-17 03:04:32\"
        },
        {
          \"start\": \"2017-05-16 12:11:48\",
          \"end\": \"2017-05-14 04:55:26\"
        },
        {
          \"start\": \"2017-05-11 05:30:21\",
          \"end\": \"2017-05-18 10:13:20\"
        },
        {
          \"start\": \"2017-05-15 05:04:22\",
          \"end\": \"2017-05-10 02:47:40\"
        }
      ]
    },
    {
      \"lecturerID\": \"59073d2be2558e6856de942e\",
      \"name\": {
        \"first\": \"Angelique\",
        \"last\": \"Rosales\"
      },
      \"email\": \"angelique.rosales@undefined.biz\",
      \"topics\": [
        \"Graphic\",
        \"AI\"
      ],
      \"events\": [
        {
          \"start\": \"2017-05-03 12:32:06\",
          \"end\": \"2017-05-11 02:18:57\"
        },
        {
          \"start\": \"2017-05-03 03:43:41\",
          \"end\": \"2017-05-10 01:58:51\"
        },
        {
          \"start\": \"2017-05-04 09:44:50\",
          \"end\": \"2017-05-05 02:55:01\"
        },
        {
          \"start\": \"2017-05-15 02:03:51\",
          \"end\": \"2017-05-19 10:19:34\"
        },
        {
          \"start\": \"2017-05-02 05:47:17\",
          \"end\": \"2017-05-03 11:45:21\"
        },
        {
          \"start\": \"2017-05-04 10:27:28\",
          \"end\": \"2017-05-14 12:20:50\"
        },
        {
          \"start\": \"2017-05-02 10:36:37\",
          \"end\": \"2017-05-09 02:15:56\"
        },
        {
          \"start\": \"2017-05-07 11:34:55\",
          \"end\": \"2017-05-13 11:09:07\"
        },
        {
          \"start\": \"2017-05-19 08:39:45\",
          \"end\": \"2017-05-04 01:30:53\"
        }
      ]
    }
  ],
  \"listRoom\": [
    {
      \"roomID\": \"590740f3ae5d1d7bf5f32468\",
      \"name\": \"7602\",
      \"email\": \"7602@undefined.me\",
      \"events\": [
        {
          \"start\": \"2017-05-14 03:39:34\",
          \"end\": \"2017-05-16 07:33:36\"
        },
        {
          \"start\": \"2017-05-17 12:30:22\",
          \"end\": \"2017-05-17 07:34:03\"
        },
        {
          \"start\": \"2017-05-16 08:04:30\",
          \"end\": \"2017-05-09 03:26:02\"
        },
        {
          \"start\": \"2017-05-03 02:51:02\",
          \"end\": \"2017-05-04 06:58:01\"
        },
        {
          \"start\": \"2017-05-15 09:58:04\",
          \"end\": \"2017-05-18 10:12:04\"
        },
        {
          \"start\": \"2017-05-03 08:24:37\",
          \"end\": \"2017-05-07 10:24:09\"
        }
      ]
    },
    {
      \"roomID\": \"590740f379684571e4f1f043\",
      \"name\": \"7606\",
      \"email\": \"7606@undefined.name\",
      \"events\": [
        {
          \"start\": \"2017-05-04 11:36:26\",
          \"end\": \"2017-05-14 03:24:54\"
        },
        {
          \"start\": \"2017-05-06 09:14:23\",
          \"end\": \"2017-05-04 01:46:53\"
        },
        {
          \"start\": \"2017-05-08 07:33:13\",
          \"end\": \"2017-05-18 11:35:58\"
        },
        {
          \"start\": \"2017-05-02 10:23:56\",
          \"end\": \"2017-05-19 08:47:42\"
        },
        {
          \"start\": \"2017-05-19 05:53:49\",
          \"end\": \"2017-05-13 03:27:44\"
        },
        {
          \"start\": \"2017-05-09 05:51:03\",
          \"end\": \"2017-05-04 12:53:56\"
        },
        {
          \"start\": \"2017-05-05 01:41:57\",
          \"end\": \"2017-05-13 02:02:54\"
        },
        {
          \"start\": \"2017-05-14 12:30:49\",
          \"end\": \"2017-05-11 08:52:27\"
        }
      ]
    }
  ]
}
}"
    # puts request.body

    response = https.request(request)
    # puts response.body

    data = JSON.parse(response.body)["result"]

    return JSON.dump(data)
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

        # puts event.to_hash
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
    render :layout => false
  end

  def get_email
    $email = params[:user][:email]
    #do your stuff with comments_from_form here
    ret = fetchUserJson($email)
    puts(ret)
    #Open view calendar
    if ret != false then
      puts("redirecting...")
      redirect_to user_session_url(email: $email, status: 'proceed'), notice: 'Succeed.'
    else
      redirect_to user_session_url(email: $email, status: 'failed'), notice: 'Failed.'
    end
  end

  def get_code
    code = params[:user][:code]
    authorize_by_code($email, code)
  end


  #####################################################
  #database query
  #####################################################
  def test_query
    puts "DOSEN==============================="
    Dosen.all.each do |dosen|
      puts dosen.nama
    end
    puts "Mahasiswa==============================="
    Mahasiswa.all.each do |mahasiswa|
      puts mahasiswa.nama
    end
    puts "EVENT==============================="
    Event.all.each do |event|
      puts event.name
    end
    puts "PEMBIMBING==============================="
    Pembimbing.all.each do |p|
      puts "dosen "+p.dosen_id.to_s
      puts "mahasiswa "+p.mahasiswa_id.to_s
    end
    puts "PENGUJI==============================="
    Penguji.all.each do |p|
      puts "dosen "+p.dosen_id.to_s
      puts "mahasiswa "+p.mahasiswa_id.to_s
    end
    puts "PERIOD==============================="
    Period.all.each do |p|
      puts p.start
    end
    puts "ROOM==============================="
    Room.all.each do |r|
      puts r.name
    end
    puts "SCHEDULED==============================="
    ScheduledEvent.all.each do |s|
      puts s.student_id
    end
  end
#########################################################################
  def getAllTokenAndEmail
    listToken = Token.all
    listDosen = Dosen.all
    period = Period.where(:period_type => 0)[0]

    @query_token = {}
    @query_token[:data] = {}

    @query_token[:data][:period] = {}
    @query_token[:data][:period][:start] = {}
    @query_token[:data][:period][:start] = period.start.to_time.iso8601
    @query_token[:data][:period][:end] = {}
    @query_token[:data][:period][:end] = period.end.to_time.iso8601

    @query_token[:data][:accounts] = []

    listDosen.each do |t|
      #puts JSON.parse(t.token_json)
      temp_json = {}

      temp_json[:email] = {}
      temp_json[:email] = t.email

      temp_token = getDosenToken(listToken, t.NIP)
      temp = JSON.parse(temp_token.token_json)['token']

      temp_json[:token] = {}
      temp_json[:token][:access_token] = {}
      temp_json[:token][:access_token] = temp['access_token']
      temp_json[:token][:refresh_token] = {}
      temp_json[:token][:refresh_token] = temp['refresh_token']
      temp_json[:token][:expiration_time_millis] = {}
      temp_json[:token][:expiration_time_millis] = temp['expiration_time_millis']

      @query_token[:data][:accounts] << temp_json
    end

    return @query_token
  end

  def getSchedulingRawData(event_type)
    @listLecturer    = Dosen.all
    @listStudent     = Mahasiswa.all
    @listPembimbing  = Pembimbing.all
    @listPenguji     = Penguji.all
    @listRoom        = Room.all
    @listEvent       = Event.all
    period = Period.where(:period_type => 0)[0]

    @query_json = {}
    @query_json[:data] = {}
    @query_json[:data][:period] = {}
    @query_json[:data][:period][:start] = {}
    @query_json[:data][:period][:start] = period.start.to_time.iso8601
    @query_json[:data][:period][:end] = {}
    @query_json[:data][:period][:end] = period.end.to_time.iso8601

    #assemble-room==============================================
    @query_json[:data][:listRoom] = []
    @listRoom.each do |r|
      room_json = {}
      room_json[:id] = {}
      room_json[:id] = r.name
      room_json[:events] = []
      room_events = getRoomEvents(@listEvent, r.name)
      room_events.each do |r_event|
        room_event = {}
        room_event[:start] = {}
        room_event[:start] = r_event.start.to_time.iso8601
        room_event[:end] = {}
        room_event[:end] = r_event.end.to_time.iso8601
        room_json[:events] << room_event
      end
      @query_json[:data][:listRoom] << room_json
    end

    #assemble-lecturer==============================================
    @query_json[:data][:listLecturer] = []
    @listLecturer.each do |l|
      lecturer_json = {}
      lecturer_json[:id] = {}
      lecturer_json[:id] = l.NIP
      lecturer_json[:events] = []
      lecturer_events = getLecturerEvents(@listEvent, l.NIP)
      lecturer_events.each do |l_event|
        lecturer_event = {}
        lecturer_event[:start] = {}
        lecturer_event[:start] = l_event.start.to_time.iso8601
        lecturer_event[:end] = {}
        lecturer_event[:end] = l_event.end.to_time.iso8601
        lecturer_json[:events] << lecturer_event
      end
      @query_json[:data][:listLecturer] << lecturer_json
    end

    #assemble-student==============================================
    @query_json[:data][:listStudent] = []
    @listStudent.each do |s|
      student_json = {}
      student_json[:id] = {}
      student_json[:id] = s.NIM
      student_pembimbings = getStudentPembimbing(@listPembimbing, s.NIM)
      student_pengujis = getStudentPenguji(@listPenguji, s.NIM)
      student_json[:idPembimbing] = []
      student_json[:idPembimbing] << student_pembimbings
      student_json[:idPenguji] = []
      student_json[:idPenguji] << student_pengujis
      @query_json[:data][:listStudent] << student_json
    end

    return @query_json
  end
  #########################################################################
  def getDosenToken(tokens, nip)
    tokens.each do |t|
      if t.owner_id == nip
        return t
      end
    end
  end
  #########################################################################
  def getRoomEvents(events, id)
    result = []
    events.each do |e|
      if e.event_type == 99
        if e.owner_id.to_s == id.to_s
          result << e
        end
      end
    end

    return result
  end

  def getLecturerEvents(events, nip)
    result = []
    events.each do |e|
      if e.event_type == 8
        if e.owner_id.to_s == nip.to_s
          result << e
        end
      end
    end

    return result
  end

  def getStudentPembimbing(pembimbings, nim)
    result = []
    pembimbings.each do |p|
      if p.mahasiswa_id.to_s == nim.to_s
        result << p.dosen_id
      end
    end

    return result
  end

  def getStudentPenguji(pengujis, nim)
    result = []
    pengujis.each do |p|
      if p.mahasiswa_id.to_s == nim.to_s
        result << p.dosen_id
      end
    end

    return result
  end

  def getLecturerFromEmail(email)
    dosen = Dosen.all
    dosen.each do |d|
      if d.email.to_s == email.to_s
        return d.NIP
      end
    end
  end
  #########################################################################
  def testInsert
    Event.new do |new_e|
      new_e.start = Time.now
      new_e.end = Time.now
      new_e.name = "opopopo"
      new_e.event_type = 12
      new_e.owner_id = "67890"
      new_e.google_event_id = "7890"

      new_e.save
    end
  end

  def updateEventsDatabase(entry)
    #delete all lecturer event
    lecturers = Event.where(:event_type => 8)
    lecturers.each do |l|
      l.destroy
    end

    #insert entry
    data = JSON.parse(entry)
    data.each do |d|
      d['events'].each do |e|
        Event.new do |new_e|
          new_e.start = e['start']
          new_e.end = e['end']
          new_e.name = e['name']
          new_e.event_type = 8
          new_e.owner_id = getLecturerFromEmail(d['email'])
          new_e.google_event_id = e['id']

          new_e.save
        end
      end
    end
  end

  def scheduleEventsSaveDatabase(entry, event_type)
    #insert entry
    data = JSON.parse(entry)
    data.each do |d|
      ScheduledEvent.new do |new_se|
        new_se.start = d['start']
        new_se.end = d['end']
        new_se.student_id = d['idStudent']
        new_se.room_id = 'Weissnat LLC'
        new_se.event_type = event_type
        new_se.event_name = d['idStudent']

        new_se.save
      end
    end
  end
  #########################################################################
  def updateEvents
    puts JSON.dump(getAllTokenAndEmail())
    puts "================================="
    uri = URI('http://ppl-scheduling.herokuapp.com/allevents')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = false

    request = Net::HTTP::Post.new(uri.path)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(getAllTokenAndEmail())

    response = https.request(request)
    puts response.body

    updateEventsDatabase(response.body)
  end
  #########################################################################
  def scheduleEvents(event_type)
    puts JSON.dump(getSchedulingRawData(event_type))
    puts "================================="
    uri = URI('http://ppl-scheduling.herokuapp.com/schedule')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = false

    request = Net::HTTP::Post.new(uri.path)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump(getSchedulingRawData(event_type))

    response = https.request(request)
    puts response.body

    scheduleEventsSaveDatabase(response.body, event_type)

    fetch_result
  end

  def routeSchedule
    scheduleEvents(params[:event_type])
  end
  #########################################################################
  def fetch_result()
    listScheduled = ScheduledEvent.all
    event = []
    listScheduled.each do |se|
      temp = {}
      temp[:text] = {}
      temp[:text] = se.event_name
      temp[:start_date] = {}
      temp[:start_date] = se.start
      temp[:end_date] = {}
      temp[:end_date] = se.end

      event << temp
    end
    render :json => JSON.dump(event)
  end
#TRUE END
end
