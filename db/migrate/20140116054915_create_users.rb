class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 30, null: false
      t.string :password_digest, null: false
      t.string :session_token

      t.timestamps
    end
    add_index :users, :name, unique: true
    add_index :users, :session_token, unique: true
  end
end
