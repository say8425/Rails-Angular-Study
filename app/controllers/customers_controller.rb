class CustomersController < ApplicationController
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      @customers = Customer.search_keyword(@keywords).page(params[:page]).per(10)
    else
      @customers = []
    end
  end
end
