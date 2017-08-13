require "twitter"
#@articles = YAML.load(File.read("2016-07-19.yml"))

# Client for lecongolais.net

@client_lecongolais = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

#client for Dr Mazembo Mavungu account

@client_mazembo = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

@message = "#RDC: Les tweets du jour: Lundi 23 Janvier 2017 (suite) http://lecongolais.net/?p=3006"
Dir.foreach("/home/mavungu/Lecongolais.net/facebook/images/2017-01-23-2") do |fname|
  next if fname == '.' or fname == '..'
  @client_lecongolais.update_with_media(@message, File.new(fname))
  @client_mazembo.update_with_media(@message, File.new(fname))
end
