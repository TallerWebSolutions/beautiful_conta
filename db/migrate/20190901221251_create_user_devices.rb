class CreateUserDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :user_devices do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :device_id
      t.string :device_hash
      t.string :arn
      t.string :arn_subscription
      t.text :original_json

      t.timestamps
    end
  end
end
