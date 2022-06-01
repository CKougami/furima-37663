FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    family_name_kana      { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birth_day             { '1988-09-26' }
  end
end
