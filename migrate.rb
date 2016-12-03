require 'shangrila'
require 'net/http'
require 'uri'
require 'json'
require 'httpclient'
require 'pathname'

year = ARGV[0]
cours = ARGV[1]
config_file_path = ARGV[2]
config_file_path ||= './config/config.json'

master_list = Shangrila::Sora.new().get_master_data(year, cours)

#p master

admin_key = nil
gae_host = nil

File.open config_file_path do |file|
  conf = JSON.load(file.read)
  admin_key = conf['AnimeAPI']['admin_key']
  gae_host = conf['AnimeAPI']['google_app_engine_host']
end

auth_header = {'X-ANIME-API-ADMIN-KEY' => admin_key}

master_list.each do |master|

  master.delete('created_at')
  master.delete('updated_at')

  json = JSON.dump(master)
  http_client = HTTPClient.new
  url = URI.parse(URI.encode( File.join('http://' + gae_host, 'anime/v1/master') ))
  response = http_client.put(url, json, auth_header)
  puts response.status

  #break
end