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
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'/tweets/show_tweet'
    else
      redirect '/login'
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :"/tweets/edit_tweet"
    else
      redirect '/login'
    end
  end

  patch '/tweets/:id' do
    binding.pry
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.update(params)
  end

  delete '/tweets/:id/delete' do

  end
end
