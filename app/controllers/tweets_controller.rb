class TweetsController < ApplicationController

  get '/tweets/new' do
    if logged_in?

      erb :'/tweets/new'
    else
      redirect to "/login"
    end
  end

  post '/tweets/new' do
    if params[:content].empty?
    redirect to "/tweets/new"
  else
    current_user.tweet << Tweet.create(:content=>params[:content])
    redirect to "/tweets"
  end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    erb :"/tweets/show_tweet"
  end

  post '/tweets/:id/delete' do
    Tweet.find_by_id(params[:id]).delete
  end

  get "/tweets/:id/edit" do
    erb :"/tweets/edit_tweet"
  end

  patch "/tweets/:id/edit" do
    redirect to "/tweets/:id"
  end



  get '/tweets' do

    if logged_in?

      @tweets = Tweet.all

    erb :"/tweets/tweets"
    else
      redirect to '/login'
    end
  end

  post '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
  end



end
