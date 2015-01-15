class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :guid, limit: 1024
      t.string :url, limit: 1024
      t.string :title, limit: 1024
      t.text :summary
      t.datetime :published_at

      t.timestamps
    end

    add_index :jobs, :guid, unique: true
  end
end
