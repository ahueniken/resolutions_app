class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.belongs_to :user
      t.string :name
      t.string :frequency
      t.timestamps
    end
  end
end
