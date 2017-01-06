class CustomersController < ApplicationController
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      @customers = Customer.search_keyword(@keywords)
    else
      @customers = []
    end
  end
end
