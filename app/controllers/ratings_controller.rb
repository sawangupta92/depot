class RatingsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :find_product

  def create
    # product = find_product
    @product.ratings.create(rating: params[:rating], user_id: session[:user_id])
    render_response
  end

  def destroy
    # product = find_product
    Rating.find_by(user_id: session[:user_id], product_id: @product.id).destroy
    render_response
  end

  def update
    # product = find_product
    rating = Rating.find_by(user_id: session[:user_id], product_id: @product.id)
    rating.update_column(:rating, params[:rating])
    render_response
  end

  private

    def record_not_found
      respond_to do |format|
        format.json
      end
    end

    def render_response
      # response = { rating: @product.average_rating, id: @product.id }
      respond_to do |format|
        format.json {render json: @product}
      end
    end

    def find_product
      @product = Product.find(params[:product_id])
    end

end