# LamdbaController to communicate with lamdba function
class LamdbaController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    # @lamdba = Lamdba.new.details
    id = Lamdba.new.details(params['lamdba'])
    # render json: { id: Lamdba.new.details(params['lamdba'])}
    redirect_to lamdba_path(id)
  end

  def new
    @lamdba = Lamdba.new
  end

  def show
    @lamdba = Lamdba.find(params[:id])
  end

  def index
    @lambda = Lamdba.all
  end
end
