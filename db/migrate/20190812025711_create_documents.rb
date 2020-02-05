class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
