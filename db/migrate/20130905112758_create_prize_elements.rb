class CreatePrizeElements < ActiveRecord::Migration
  def change
    create_table :prize_elements do |t|
      t.string :name
      t.decimal :value
      t.references :prize, index: true

      t.timestamps
    end
  end
end
