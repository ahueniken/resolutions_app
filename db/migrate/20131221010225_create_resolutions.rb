class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|

      t.timestamps
    end
  end
end
