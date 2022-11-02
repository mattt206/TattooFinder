class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_services, only: %i[show edit update destroy]

  def index
    @filtro = params[:filtrop]
    if params[:query].present?
      @query = params[:query].downcase
      @services = Service.where("style LIKE '%#{@query}%'")
      map
      if @services.size.zero?
        @services = Service.all
      end
    else
      @services = Service.all
      map
    end
  end

  def show
    @user = User.find(@service.user_id)
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

  def map
    @providers = Provider.all
    @markers = @providers.geocoded.map do |provider|
      {
        lat: provider.latitude,
        lng: provider.longitude,
        info_window: render_to_string(partial: "info_window", locals: { provider: provider }),
        image_url: helpers.asset_url("icontattoomachine.png")
      }
    end
  end

  private

  def set_services
    @service = Service.find(params[:id])
  end

  def services_params
    params.require(:service).permit(:user_id, :style, :price, :description, :photo)
  end
end
