class AddColumnExternalIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :external_id, :string, index: true
  end
end
