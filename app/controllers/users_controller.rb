class UsersController < ApplicationController

  get '/users/show' do
    erb :'/users/show'
  end
end
