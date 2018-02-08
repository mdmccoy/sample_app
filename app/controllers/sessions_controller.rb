class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # do something about logging in
    else
      flash('Incorrect email/password.')
      render 'new'
    end
  end

  def destroy; end
end
