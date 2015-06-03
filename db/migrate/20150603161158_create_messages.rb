class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true, foreign_key: true		#keeps track of which conversation a message belongs to.
      t.references :user, index: true, foreign_key: true			#keeps track of the user who sent the message during chat.

      t.timestamps null: false
    end
  end
end
