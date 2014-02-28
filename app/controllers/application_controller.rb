class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :update_last_seen

	private
	  def update_last_seen
	  	if signed_in?
		  	if (current_user.last_seen == nil)
		  		current_user.update_attribute(:last_seen, DateTime.now)
		  	elsif (DateTime.now - 1.day) > current_user.last_seen 
		      current_user.update_attribute(:last_seen, DateTime.now)
		      update_streaks
		      puts "-------- UPDATE last seen!!! ------"
		    end
		  end
	  end

	  def update_streaks
	  	resolutions = current_user.resolutions
	  	puts "-------- get resolutions ------"
	  	resolutions.each do |resolution|
	  		update_streak(resolution)
	  	end
	  end

	  def update_streak(resolution)
	  	puts "-------- UPDATE STREAK!!! ------"
	  	puts "-------- UPDATE STREAK!!! ------"
	  	puts "-------- UPDATE STREAK!!! ------"
	  	puts "-------- UPDATE STREAK!!! ------"
	  	puts "-------- UPDATE STREAK!!! ------"
			resolution
			current_streak = 0
			date = Date.today
			records = resolution.resolution_records
			records.each do |record|
				if record.date == date 
					current_streak += 1
					date = date - 1
				end
			end
			if date == Date.today
				date = date - 1
				current_streak = 0
				records.each do |record|
					if record.date == date 
						current_streak += 1
						date = date - 1
					end
				end
			end
			puts "----- new streak is :#{current_streak}"
			resolution.update_attribute(:current_streak, current_streak)
		end


end
