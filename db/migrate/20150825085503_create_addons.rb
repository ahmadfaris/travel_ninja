class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|
      t.string :name
      t.belongs_to :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
