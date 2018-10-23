class TweetsController < ApplicationController

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    else
      redirect to "/login"
    end
  end

  post '/tweets/new' do
    if params[:content] == ""
      redirect to "/tweets/new"
    else
      @tweet = Tweet.create(:content=>params[:content])
      @tweet.user_id = current_user.id
      @tweet.save
      redirect to "/tweets"
    end
  end

  get '/tweets/:id' do
    if logged_in?
    @tweet = Tweet.find_by_id(params[:id])
    erb :"/tweets/show_tweet"
    else
      redirect to "/login"
    end
  end

  post '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])

  end

  post '/tweets/:id/delete' do
    Tweet.find_by_id(params[:id]).delete
  end

  get "/tweets/:id/edit" do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :"/tweets/edit_tweet"
    else
      redirect to "/login"
    end
  end

  patch "/tweets/:id/edit" do

    tweet = Tweet.find_by_id(params[:id])
    tweet.content = params[:content]
    tweet.save
    redirect to "/tweets/#{tweet.id}"

end



  get '/tweets' do

    if logged_in?
      @user = User.find_by_id(session[:user_id])
      @tweets = Tweet.all
      
    erb :"/tweets/tweets"
    else
      redirect to '/login'
    end
  end




end
