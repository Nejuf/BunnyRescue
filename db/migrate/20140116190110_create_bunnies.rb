class CreateBunnies < ActiveRecord::Migration
  def change
    create_table :bunnies do |t|
      t.string :name, limit: 30, null: false
      t.string :status, default: "unknown"
      t.integer :age, default: 0 #in months
      t.text :desc, default: "Soft and fluffy, of course!"
      t.string :temperment, default: "unknown"
      t.integer :owner_id
      t.string :gender, default: "unknown"
      t.boolean :fixed

      t.timestamps
    end
    add_index :bunnies, :name
    add_index :bunnies, :status
    add_index :bunnies, :owner_id
  end
end
