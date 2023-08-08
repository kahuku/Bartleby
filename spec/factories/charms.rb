FactoryBot.define do
  factory :charm do
    name { Faker::Name.name }
    school { %w[Fire Ice Storm Life Death Myth Balance].sample }
    percentage { Faker::Number.between(from: -1000, to: 1000) }
    pips { Faker::Number.between(from: 0, to: 10) }
  end
end
