class ReviewsController < ApplicationController
  before_action :set_services, only: [:new, :create]

  def new
    @service = Service.find(params[:service_id])
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.service = @service
    @review.save
    redirect_to service_path(@service)

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to service_path(@review)
  end

  private

  def set_services
    @service = Service.find(params[:service_id])
  end

  def reviews_params
    params.require(:review).permit(:content, :rating, :service_id)
  end
end
