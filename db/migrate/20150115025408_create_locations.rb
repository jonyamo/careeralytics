class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name

      t.timestamps
    end

    create_table :jobs_locations, id: false do |t|
      t.belongs_to :job, index: true
      t.belongs_to :location, index: true
    end

    add_column :jobs, :allows_remote, :boolean
  end
end
