FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '木下' }
    last_name { '拓也' }
    family_name_phonetic { 'キノシタ' }
    last_name_phonetic { 'タクヤ' }
    birthday { '1986-11-16' }
  end
end
