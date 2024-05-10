# frozen_string_literal: true

# Sleep place where dreams are seen
#
# Attributes:
#   created_at [DateTime]
#   dreams_count [Integer], counter cache
#   name [String], required
#   updated_at [DateTime]
#   user_uuid [UUID], required
#   uuid [UUID], required
class SleepPlace < ApplicationRecord
  include HasUuid

  has_many :dreams, dependent: :nullify

  validates :user_uuid, presence: true
  validates :name,
            presence: true,
            length: { minimum: 1, maximum: 100 },
            uniqueness: { scope: :user_uuid }
end
