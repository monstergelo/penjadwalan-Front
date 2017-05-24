OmniAuth.config.logger = Rails.logger

client_id = "806339176753-cmb1mv9g8itmir0p4ucqh0ibuhbl6s0k.apps.googleusercontent.com"
client_secret = "PF6m7fxfIzu8g3AhyMI3VoAz"
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, client_id, client_secret, {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end