class ResolutionsController < ApplicationController
  before_filter :signed_in_user

  def new
  	@resolution = Resolution.new
  end

  def edit
  end

  def create
  	@resolution = current_user.resolutions.new(params[:resolution])
  	if @resolution.save
  		flash[:success] = "Resolution Added!"
  		redirect_to current_user
  	else
  		flash.now[:error] = 'Unable to create resolution'
  		render 'new'
  	end
  end

  def show
    @resolution = current_user.resolutions.find(params[:id])
    @records = @resolution.resolution_records
  end


  private

  	def resolution_params
		  params.require(:resolution).permit(:name, :frequency)
		end
  

end
