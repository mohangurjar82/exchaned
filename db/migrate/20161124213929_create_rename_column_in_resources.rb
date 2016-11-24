class CreateRenameColumnInResources < ActiveRecord::Migration
  def change
    create_table :rename_column_in_resources do |t|
       rename_column :resources, :title, :name
    end
  end
end
