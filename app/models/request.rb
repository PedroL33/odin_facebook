class Request < ApplicationRecord
    belongs_to :to_user, class_name: "User", foreign_key: :to_id
    belongs_to :from_user, class_name: "User", foreign_key: :from_id

    validate :self_request

    def self_request
        errors.add(:error, "Cannot be friends with yourself") if to_id == from_id
    end
end
