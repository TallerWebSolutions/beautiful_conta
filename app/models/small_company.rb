class SmallCompany < ApplicationRecord
  belongs_to :user

  validates :cnpj, :social_name, :fantasy_name, :zipcode, :address, :neighborhood, :city, :state, :status, presence: true

  scope :basics, -> { where.not(featured: true) }
  scope :premiums, -> { where(featured: true) }
end
