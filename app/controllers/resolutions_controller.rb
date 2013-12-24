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

  private

  	def resolution_params
		  params.require(:resolution).permit(:name, :frequency)
		end
  
    def signed_in_user  
      redirect_to signin_path, notice: "Please sign in." unless signed_in?   
    end 
end
