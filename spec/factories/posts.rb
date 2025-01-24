FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    tag { "" }
    status { Post.statuses.values.sample }
    is_admin { Post.is_admins.values.sample }

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
  end
end
