# frozen_string_literal: true

# Personal dream pattern
#
# Attributes:
#   created_at [DateTime]
#   name [String], required
#   updated_at [DateTime]
#   user_uuid [UUID], required
#   uuid [UUID], required
class PersonalPattern < ApplicationRecord
  include HasUuid

  validates :user_uuid, presence: true
  validates :name,
            presence: true,
            length: { minimum: 1, maximum: 100 },
            uniqueness: { scope: :user_uuid }
end
