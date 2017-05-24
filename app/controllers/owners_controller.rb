class OwnersController < ApplicationController

  before_action :authorize, except:[:new, :create]

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      p @owner
      session[:owner_id] = @owner.id
      redirect_to @owner
    else
      flash[:error] = @owner.errors.full_messages.join(" ")
      render :new
    end
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    # stretch
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def update
    owner_id = params[:id]
    owner = Owner.find_by(id: owner_id)
    if owner.update(owner_params)
      redirect_to owner_path(owner)
    else
      flash[:error] = owner.errors.full_messages.join(", ")
      redirect_to edit_owner_path(owner)
    end
  end

  def destroy
    # stretch
  end

  # TODO: add custom appointments action for convenience

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
  end

end
