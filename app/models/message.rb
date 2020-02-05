class Message < ApplicationRecord
  belongs_to :user
  
  STATUSES = ['pendente', 'enviada', 'recebida', 'lida', 'suporte']
  REPLIES = [nil, 'auto', 'manual']

  validates :text, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :reply_from, inclusion: { in: REPLIES }
  validate :set_reply_id, on: :create

  before_create :set_status
  before_validation :set_status, on: :create
  after_create :send_message_to_watson


  def replies
    REPLIES
  end

  def statuses
    STATUSES
  end

  def replied
    User.find(self.reply_id) unless self.reply_from != 'manual'
  end


  def create_message_from_support params
  end

  private
  def set_reply_id
    errors.add(:reply_id, 'reply_id é obrigatório se for uma resposta do suporte') if self.reply_from == 'manual' && self.reply_id.blank?
  end

  def set_status
    if self.reply_from.blank? && self.status.blank?
      self.status = 'pendente'
    elsif self.reply_from == 'manual' && self.status.blank?
      self.status = 'suporte'
    end
  end

  def send_message_to_watson
    if self.reply_from.nil? && Robot.first.present? && Robot.first.robot_type == 'watson' && self.status == 'pendente'
      watson = Robots::Watson.new Robot.first
      watson.send_a_message_to_robot self      
    end
  end

end