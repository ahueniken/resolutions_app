class AddCurrentStreakToResolution < ActiveRecord::Migration
  def change
    add_column :resolutions, :current_streak, :integer
  end
end
