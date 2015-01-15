class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, unique: true

      t.timestamps
    end

    add_index :companies, :name, unique: true
    add_reference :jobs, :company, index: true
  end
end
