FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    tag { "" }
    status { "MyString" }
    is_admin { false }
  end
end
