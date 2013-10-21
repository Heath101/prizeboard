class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.boolean :active
      t.string :title
      t.string :description
      t.references :category, index: true

      t.timestamps
    end
  end
end
