class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.string :action
      t.string :arguments
      t.string :video_uri
      t.string :status
      t.date :publish_date

      t.timestamps
    end
  end
end
