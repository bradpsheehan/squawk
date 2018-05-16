class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references 'user', index: true
      t.references 'chatroom', index: true
      t.text 'content'

      t.timestamps
    end
  end
end
