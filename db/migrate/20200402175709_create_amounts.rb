class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.decimal :price
      t.string :period
      t.belongs_to :property
      t.belongs_to :currency

      t.timestamps
    end
  end
end
