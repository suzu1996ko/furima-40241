FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { Faker::Date.backward }
    first_name            { person.first.kanji }
    family_name           { person.last.kanji }
    first_name_kana       { person.first.katakana }
    family_name_kana      { person.last.katakana }
  end
end
