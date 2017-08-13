require "twitter"
require "yaml"
require "koala"
@articles = YAML.load(File.read("2017-07-19.yml"))
@size = @articles.length

# Client for lecongolais.ne

@client_lecongolais = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end
#
# #client for Dr Mazembo Mavungu account
#
@client_mazembo = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end
@articles.each do |article|
   sleep 5
   @client_lecongolais.update_with_media("#{article[1]["tweet_message"]}", File.new("#{article[1]["picture"]}"))
   sleep 5
   @client_mazembo.update_with_media("#{article[1]["tweet_message"]}", File.new("#{article[1]["picture"]}"))
end
puts "You have Successfully tweeted a collection of #{@size} tweets"

# Now posting to facebook
access_token = YAML.load(File.read("access-data.yml"))
lecongolais = access_token["lecongolais"]
user_token = access_token["user_token"]
@graph = Koala::Facebook::API.new(user_token)
@graph_page = Koala::Facebook::API.new(lecongolais)
@action = "Aimez notre page https://www.facebook.com/LekongolaisNet/ --Nous suivre sur Twitter https://twitter.com/LecongolaisNet (@LecongolaisNet)"

# posting to my page lecongolais.net
@articles.each do |article|
  begin
     message = article[1]["title"] + "---" + article[1]["short_message"]+ "---" + @action
     @graph_page.put_picture("#{article[1]["picture"]}", {:message => message })
  rescue
    puts "There was a problem trying to post to the Lecongolais Page"
    exit
  end
end
puts "Successfully posted to the Lecongolais Page"
@articles.each do |article|
  begin
    message = article[1]["title"] + "---" + article[1]["short_message"]+ "---" + @action
    @graph.put_picture("#{article[1]["picture"]}", {:message => message})
  rescue
    puts "There was an error trying to post to maz mav timeline"
    exit
  end
end
puts "Successfully posted to the Maz Mav Timeline"
