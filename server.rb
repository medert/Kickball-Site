require "sinatra"
require 'json'
require 'erb'
require 'pry'

set :public_folder, File.join(File.dirname(__FILE__), "public")

file = File.read('roster.json')

teams = JSON.parse(file)
team_names = []

teams.each do |name, team|
  team_names << name
end


get "/teams" do
  @team_names = team_names
  erb :index
end

get "/teams/:team_name" do
  @teams = teams
  @team_name = params[:team_name]

  erb :team_list
end
