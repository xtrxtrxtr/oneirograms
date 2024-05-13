# frozen_string_literal: true

FactoryBot.define do
  factory :dream_personal_pattern do
    transient do
      user_uuid { SecureRandom.uuid }
    end

    dream { association(:dream, user_uuid:) }
    personal_pattern { association(:personal_pattern, user_uuid:) }
  end
end
