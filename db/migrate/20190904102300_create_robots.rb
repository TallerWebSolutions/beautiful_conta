class CreateRobots < ActiveRecord::Migration[5.2]
  def change
    create_table :robots do |t|
      t.string :robot_type
      t.string :apikey
      t.string :service_url
      t.string :version

      t.timestamps
    end
  end
end
