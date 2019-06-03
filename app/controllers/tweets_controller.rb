class TweetsController < ApplicationController
  get '/tweets' do

    # binding.pry
    if logged_in?
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    else
      redirect '/login'
    end
  end



  post '/tweets' do
    if !params[:content].empty?
      current_user.tweets << Tweet.create(params)
      current_user.save
    else
      redirect '/tweets/new'
    end
  end

  get '/tweets/:id' do
    erb :'/tweets/show_tweet'
  end

  get '/tweets/:id/edit' do

  end

  post '/tweets/:id' do

  end

  delete '/tweets/:id/delete' do

  end
end
