class AddResuploaderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :resuploader, :str
  end
end
