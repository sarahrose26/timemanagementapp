require './config/environment'
require './app/models/scheduler_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post '/results' do
    date = params[:date]
    
    unix_time = to_unix_time(date)
    @minutes_left = time_to_go(unix_time)
    erb :results 
  end  
  
end
