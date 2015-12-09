class SessionsController < ApplicationController
  def new
    @session = Session.new(email: session[:email])
  end

  def create
    @session = Session.new(params[:session])
    if @session.valid?
      session[:user_id] = @session.user_id
      redirect_to current_user
    else
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
