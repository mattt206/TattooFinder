class ProvidersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_providers, only: %i[show edit update destroy]

  def index
    @providers = Provider.all
  end

  def show
    # crear array para guardar todos los usuarios registrados
    @userstoselect = []
    @user = User.new
    @users = User.all
    search
    @artist = params[:artist]
    @resultuser = User.where("id = ? ", @artist.to_i)
    unless @resultuser.empty?
      @resultuser[0].provider_id = @provider.id
      @resultuser[0].save
    end

  end


  def new
    @provider = Provider.new
  end

  def create
    params["provider"][:user_id] = current_user.id
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

  def search
    if params[:query].present?
      @query = params[:query]
      @users = User.where("nickname LIKE '%#{@query}%' OR nickname LIKE '%#{@query.upcase}%'")
    end
  end


  def set_providers
    @provider = Provider.find(params[:id])
  end

  def providers_params
    params.require(:provider).permit(:name, :description, :address, :latitude, :longitude,
      :start_time, :close_time, photos: [], category: [])
  end
end
