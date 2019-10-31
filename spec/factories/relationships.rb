# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    association :user
    association :follow, factory: :user
  end
end
