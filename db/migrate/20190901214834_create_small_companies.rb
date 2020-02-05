class CreateSmallCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :small_companies do |t|
      t.references :user, foreign_key: true
      t.string :cnpj
      t.string :social_name
      t.string :fantasy_name
      t.string :zipcode
      t.string :address
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :type
      t.string :status
      t.boolean :featured

      t.timestamps
    end
  end
end
