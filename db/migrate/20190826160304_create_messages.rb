class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :message_type
      t.string :text
      t.string :reply_type
      t.string :status
      t.string :reply_from
      t.integer :reply_id
      t.text :original_json
      t.string :action
      t.string :arguments

      t.timestamps
    end
  end
end
