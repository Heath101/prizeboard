class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.boolean :active
      t.references :category, index: true

      t.timestamps
    end
  end
end
