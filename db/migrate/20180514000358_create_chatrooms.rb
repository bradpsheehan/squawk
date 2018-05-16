class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.string 'slug', limit: 255, index: true
      t.text 'topic'

      t.timestamps
    end
  end
end
