class TwitterInfosController < ApplicationController

  def index
     if params[:user_name]
       @twitter_infos =  TwitterInfo.get_user_info(params[:user_name])
     else
       'no record'
     end
  end




end
