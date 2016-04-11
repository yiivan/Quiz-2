class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit(:name, :email, :department, :message)
    @request = Request.new(request_params)

    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def index
    # @requests = Request.all
    @requests = Request.order(:name).page params[:page]
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
      request_params = params.require(:request).permit(:name, :email, :department, :message)

      if @request.update request_params
        redirect_to requests_path
      else
        render :edit
      end
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

  def done
    redirect_to requests_path
  end

  def result
    # @requests = Request.search(params[:search], params[:id])
    # @requests = Request.order(:name).page params[:page]
    @requests = Request.search(params[:search], params[:id]).order(:name).page params[:page]
  end

end
