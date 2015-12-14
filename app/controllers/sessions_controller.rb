class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to current_user
    else
      @session = Session.new(email: session[:email])
    end
  end

  def create
    @session = Session.new(params[:session])
    if @session.valid?
      session[:user_id] = @session.user_id
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
