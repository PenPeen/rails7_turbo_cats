FactoryBot.define do
  factory :cat do
    name {"sample_cat"}
    
    # 0~25
    age {Faker::Number.between(from: 0, to: 25)}
  end
end
