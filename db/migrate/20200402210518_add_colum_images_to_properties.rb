class AddColumImagesToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :images, :jsonb
  end
end
