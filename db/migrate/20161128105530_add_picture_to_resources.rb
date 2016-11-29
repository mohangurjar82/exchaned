class AddPictureToResources < ActiveRecord::Migration
  def change
    add_column :resources, :picture, :string
  end
end
