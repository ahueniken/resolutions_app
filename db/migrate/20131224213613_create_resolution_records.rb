class CreateResolutionRecords < ActiveRecord::Migration
  def change
    create_table :resolution_records do |t|
      t.belongs_to :resolution
      t.int :rating
      t.timestamps
    end
  end
end
