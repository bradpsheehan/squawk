class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string 'username', limit: 255, index: true
      t.string 'email', limit: 255, index: true
      t.string 'password_digest', limit: 255
      t.string 'first_name', limit: 255
      t.string 'last_name', limit: 255

      t.timestamps
    end
  end
end
