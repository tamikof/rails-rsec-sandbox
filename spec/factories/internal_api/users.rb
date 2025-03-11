FactoryBot.define do
  factory :internal_api_user, class: Hash do
    id { SecureRandom.uuid }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    role { [ 'admin', 'sales_manager', 'corp_manager', 'sales_user', 'corp_user' ].sample }
    status { [ 'active', 'inactive' ].sample }
    created_at { Time.now }
    updated_at { Time.now }

    initialize_with { attributes }

    trait :admin do
      role { 'admin' }
    end

    trait :sales_manager do
      role { 'sales_manager' }
    end

    trait :corp_manager do
      role { 'corp_manager' }
    end

    trait :sales_user do
      role { 'sales_user' }
    end
  end
end
