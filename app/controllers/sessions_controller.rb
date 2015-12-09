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
      render new_sessions_path
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end

  def edit
    redirect_to root_path(current_user) and return if require_person.password_digest
  end
end
