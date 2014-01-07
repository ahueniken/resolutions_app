class ResolutionRecordsController < ApplicationController

	before_filter :signed_in_user

	def destroy
	end

	def create  
		@resolution = current_user.resolutions.find_by_id(params[:resolution_record][:id])  
	  @record = @resolution.resolution_records.build(params[:resolution_record])
		if @record.save  
		  flash[:success] = "Record Added!"
		  streak = get_current_streak(@resolution.id)
		  @resolution.update_attribute(:current_streak, streak)
		  redirect_to current_user 
		else  
		  redirect_to root_path 
 		end   
	end	

	private
		def get_current_streak(resolution_id)
			@current_resolution = current_user.resolutions.find_by_id(resolution_id)
			current_streak = 0
			date = Date.today
			@records = @current_resolution.resolution_records.sort_by { |date| }.reverse
			@records.each do |record|
				if record.date == date 
					current_streak += 1
					date = date - 1
				end
				if date = Date.today
					date = date - 1 
				end
			end
			return current_streak
		end

end
