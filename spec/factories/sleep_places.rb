# frozen_string_literal: true

FactoryBot.define do
  factory :sleep_place do
    user_uuid { SecureRandom.uuid }
    sequence(:name) { |n| "Sleep place #{n}" }
  end
end
