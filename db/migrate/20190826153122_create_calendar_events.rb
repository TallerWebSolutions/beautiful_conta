class CreateCalendarEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_events do |t|
      t.references :user, foreign_key: true
      t.integer :contact_id
      t.date :date
      t.string :start_time
      t.string :end_time
      t.string :name
      t.string :phone
      t.string :email
      t.references :service, foreign_key: true
      t.decimal :value
      t.string :payment_method
      t.string :note
      t.string :status

      t.timestamps
    end
  end
end
