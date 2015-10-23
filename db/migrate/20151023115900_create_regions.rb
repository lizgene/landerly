class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.timestamps
    end

    create_table :trainings_regions, id: false do |t|
      t.belongs_to :training, index: true
      t.belongs_to :region, index: true 
    end
  end
end
