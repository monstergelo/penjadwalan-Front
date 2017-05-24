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
      user.oauth_refresh_token = auth.credentials.refresh_token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!

    #   Generate JSON to POST
      myjson={}
      tjson = {
          "email" => user.email,
          "access_token" =>user.oauth_token,
          "refresh_token" =>user.oauth_refresh_token,
          "expiration_at" => user.oauth_expires_at.to_time.to_i
      }
      myjson[:token] ||= {}
      myjson[:token] = tjson

    #   POST
      datatopost = JSON.dump(myjson)
      puts datatopost
      sendPOST("http://ppl-scheduling.herokuapp.com/login",datatopost )
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
end