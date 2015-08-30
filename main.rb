require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'sqlite3'
require 'pry'
require 'sinatra/flash'


ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
	:adapter => 'sqlite3',
	:database => 'database.db'
)

class Band < ActiveRecord::Base
end

after do
	ActiveRecord::Base.connection.close
end



get '/' do
	erb :home
end

get '/bands' do
	@bands = Band.all
	erb :'bands/index'
end


get '/bands/new' do
	erb :'bands/new'
end

post '/bands' do
	band = Band.new

	if params[:name].empty?
		flash.now[:name] = "Please insert a name"
		redirect to "/bands/new"
	else
		band.name = params['name']
		band.blurb = params['blurb']
		band.image = params['image']
		band.youtube = params['youtube']
		band.save

	redirect to "/bands/#{ band.id }"
	end
end


get '/bands/:id' do
	@band = Band.find params[:id]
	erb :'bands/show'
end

get '/bands/:id/edit' do
	@band = Band.find params[:id]
	erb :'bands/edit'
end

post '/bands/:id' do
	band = Band.find params[:id]
	band.update :name => params[:name], :blurb => params[:blurb], :image => params[:image], :youtube => params[:youtube]

	redirect to "/bands/#{band.id}"
end

get '/bands/:id/delete' do
	band = Band.find params[:id]
	band.destroy
	redirect to '/bands'
end
