FactoryBot.define do
  factory :spell do
    name { Faker::Name.name }
    pips { Faker::Number.between(from: 1, to: 10) }
    school { %w[Fire Ice Storm Life Death Myth Balance].sample }
    accuracy { Faker::Number.between(from: 1, to: 100) }
    damage { Faker::Number.between(from: 1, to: 1000) }
  end
end
