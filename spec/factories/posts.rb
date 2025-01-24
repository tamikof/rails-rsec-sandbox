FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    tag { "" }
    status { Post.statuses.values.sample }
    is_admin { Post.is_admins.values.sample }
  end
end
