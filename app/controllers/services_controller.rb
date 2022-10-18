class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_services, only: %i[show edit update destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    params["service"][:user_id] = current_user.id
    @service = Service.new(services_params)
    if @service.save
      redirect_to  services_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @service.update(services_params)
    redirect_to service_path(@service)
  end

  def edit
  end

  def destroy
    @service.destroy
    redirect_to services_path, status: :see_other
  end

  def dashboard
    @usuario = current_user.id
  end

  private

  def set_services
    @service = Service.find(params[:id])
  end

  def services_params
    params.require(:service).permit(:user_id, :style, :price, :description, :photo)
  end

end
