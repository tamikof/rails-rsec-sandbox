FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence}
    status { Post.statuses.values.sample }
    role { Post.roles.values.sample }
    permission { Post.permissions.values.sample }
  
    trait :draft do
      status { :draft }
    end

    trait :published do
      status { :published }
    end

    trait :archived do
      status { :archived }
    end

    trait :admin do
      is_admin { :admin }
    end

    trait :general do
      is_admin { :general }
    end

    trait :permission_hidden do
      permission { :hidden }
    end

    trait :permission_read do
      permission { :read }
    end

    trait :permission_write do
      permission { :write }
    end
  end
end
