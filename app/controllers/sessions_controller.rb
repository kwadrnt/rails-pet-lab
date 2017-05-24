class SessionsController < ApplicationController
  def new
  end

  def create
    owner = Owner.find_by_email(params[:email])
    if owner && owner.authenticate(params[:password])
      session[:owner_id] = owner.id
      redirect_to '/' #add route to show logged in
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:owner_id] = nil
    redirect_to '/login'
  end

end
