class CreateRenameResourcesColumn < ActiveRecord::Migration
  def change
    create_table :rename_resources_columns do |t|
       rename_column :resources, :type, :resource_type
    end
  end
end
