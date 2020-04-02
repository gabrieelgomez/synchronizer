class AddColumnFeaturesToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :features, :jsonb
  end
end
