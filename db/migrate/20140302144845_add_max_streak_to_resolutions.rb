class AddMaxStreakToResolutions < ActiveRecord::Migration
  def change
  	add_column :resolutions, :max_streak, :integer
  end
end
