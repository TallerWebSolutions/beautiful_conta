class UserDevice < ApplicationRecord
  belongs_to :user
  
  PROVIDERS = ['ios', 'android', 'web']
  
  validates :provider, inclusion: { in: PROVIDERS }
  validates :device_id, uniqueness: { scope: :user_id }

  def providers
    PROVIDERS
  end
end
