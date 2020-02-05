class User < ApplicationRecord
	attr_accessor :email_or_phone
  
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

    has_many :user_devices, dependent: :destroy
    has_many :contacts, dependent: :destroy
    has_many :services, dependent: :destroy
    has_many :documents, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_one :small_company, dependent: :destroy

    has_one_attached :avatar, dependent: :destroy

    @@user_types = ['Client', 'Admin', 'Manager', 'Support']
    validates :user_type, inclusion: { in: @@user_types }

    validates :phone, uniqueness: true, allow_blank: true
    before_validation :set_login_type, :set_type

    scope :clients, -> { where(user_type: 'Client') }
    scope :not_clients, -> { where.not(user_type: 'Client') }
    scope :last_messages, -> { includes(:messages).where('user_id IS NOT NULL').order('messages.created_at DESC') }

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if email_or_phone = conditions.delete(:email_or_phone)
        where(conditions.to_h).where(["lower(phone) = :value OR lower(email) = :value", { value: email_or_phone.downcase }]).first
      elsif conditions.has_key?(:email) || conditions.has_key?(:phone)
        where(conditions.to_h).first
      end
    end

    def self.android
      includes(:user_devices).where(user_devices: { provider: 'android' })
    end

    def self.ios
      includes(:user_devices).where(user_devices: { provider: 'ios' })
    end

    def self.web
      includes(:user_devices).where(user_devices: { provider: 'web' })
    end

    def user_types
      @@user_types
    end

    def email_required?
    	false
  	end

  	private
  	def set_login_type
      unless email_or_phone.blank?
    		if email_or_phone.include?"@"
    			self.email = email_or_phone
    		else
    			self.phone = email_or_phone
    		end
      end
  	end

    def set_type
      self.user_type = 'Client' if self.user_type.blank?
    end
end
