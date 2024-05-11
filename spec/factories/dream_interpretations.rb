# frozen_string_literal: true

FactoryBot.define do
  factory :dream_interpretation do
    dream
    user_uuid { SecureRandom.uuid }
    body { 'This dream is interpreted in test mode' }
  end
end
