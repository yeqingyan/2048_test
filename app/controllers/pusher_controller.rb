Pusher.app_id = '98953'
Pusher.key = '23b15d03c693f55815cd'
Pusher.secret = '38f65acf147a14408cfc'

class PusherController < ApplicationController
  protect_from_forgery :except => :auth

  def auth
    #if current_user
    auth = Pusher[params[:channel_name]].authenticate(params[:socket_id])

    render :text => params[:callback] + "(" + auth.to_json + ")", :content_type => 'application/javascript'
    #else
      #render :text => "Forbidden", :status => '403'
    #end
  end
end
