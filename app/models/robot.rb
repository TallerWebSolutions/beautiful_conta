class Robot < ApplicationRecord

    ROBOT_TYPES = ['watson']
    validates :robot_type, inclusion: { in: ROBOT_TYPES }

    before_validation :set_robot_type

    def robot_types
        ROBOT_TYPES
    end

    private
    def set_robot_type
        self.robot_type = 'watson' if self.robot_type.blank?
    end
end
