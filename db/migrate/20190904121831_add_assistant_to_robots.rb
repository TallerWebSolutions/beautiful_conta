class AddAssistantToRobots < ActiveRecord::Migration[5.2]
  def change
    add_column :robots, :assistant_id, :string
    add_column :robots, :assistant_name, :string
    add_column :robots, :assistant_url, :string
  end
end
