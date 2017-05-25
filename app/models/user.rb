class User < ActiveRecord::Base
  require 'json'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      puts auth
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      if auth.credentials.refresh_token.nil?
        puts "old user"
      else
        user.oauth_refresh_token = auth.credentials.refresh_token
      end
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!

      #   Generate JSON to POST
      myjson={
          "email" => user.email
      }
      tjson = {
          "access_token" =>user.oauth_token,
          "refresh_token" =>user.oauth_refresh_token,
          "expiration_time_millis" => user.oauth_expires_at.to_time.to_i
      }
      myjson[:token] ||= {}
      myjson[:token] = tjson

      #   POST
      datatopost = JSON.dump(myjson)
      puts datatopost
      # puts datatopost
      # sendPOST("http://ppl-scheduling.herokuapp.com/login",datatopost )

      # SAVE
      save_token(user.email,datatopost)
    end
  end

  def self.sendPOST(url, data)
    begin
      uri = URI(url)

      # Create the HTTP objects TEXT
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = false
      request = Net::HTTP::Post.new(uri.path)
      request["Content-Type"] = "application/json"
      request.body = data
      puts "REQUEST : "+request.body
      # Send the request
      response = http.request(request)
      puts "RESPON :"+response.body
    rescue Exception=>msg
      puts "Connection error.\n"
      puts msg
    end
  end

  def self.save_token(user_id, data)
    file_json_path = "token_"+user_id+"_ruby.json"
    path = File.join(Dir.home, '.credentials',
                     file_json_path)
    File.open(path, 'w') {
        |file| file.write(data)
    }
    puts 'SAVED\n'
  end
end