FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    tag { "" }
    status { "draft" }
    is_admin { false }
  end
end
