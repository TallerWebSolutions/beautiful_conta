class AddSkillsToRobots < ActiveRecord::Migration[5.2]
  def change
    add_column :robots, :skill_id, :string
    add_column :robots, :skill_name, :string
  end
end
