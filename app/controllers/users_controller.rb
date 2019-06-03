class UsersController < ApplicationController

  get '/users/:slug' do
    binding.pry
    erb :'/users/show'
  end


end
