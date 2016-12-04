class CreateDownloadedResources < ActiveRecord::Migration
  def change
    create_table :downloaded_resources do |t|
      t.integer :resource_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
