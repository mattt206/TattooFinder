class ProvidersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_providers, only: %i[show edit update destroy]

  def index
    @providers = Provider.all
  end

  def show
    @artists = []
    user_id = @provider.user_id
    @artists << User.where(["id = ?", "#{user_id}"])
  end

  def new
    @provider = Provider.new
  end

  def create
    params["provider"][:user_id] = current_user.id
    # @var = params["provider"][:category]
    # params[:provider][:category].shift
    # @var = @provider[:category].shift
    @provider = Provider.new(providers_params)
    @provider.category.shift
    if @provider.save
      redirect_to  providers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @provider.update(providers_params)
    redirect_to provider_path(@provider)
  end

  def edit
  end

  def destroy
    @provider.destroy
    redirect_to providers_path, status: :see_other
  end


  private

  def set_providers
    @provider = Provider.find(params[:id])
  end

  def providers_params
    # params.require(:provider).permit(:user_id, :name, { :category => [] }, :description, :address, :latitude, :longitude,
    # :start_time, :close_time, :photos)
    params.require(:provider).permit(:user_id, :name, :description, :address, :latitude, :longitude,
      :start_time, :close_time, :photos, category: [])
  end
end
