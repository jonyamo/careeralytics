class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, unique: true

      t.timestamps
    end

    create_table :categories_jobs, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :job, index: true
    end
  end
end
