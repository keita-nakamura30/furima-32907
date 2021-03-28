FactoryBot.define do
  factory :user do
    nickname              {'中村'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {'c135612d'}
    name_firstname        {'啓太'}
    name_lastname         {'中村'}
    name_firstname_kana   {'ナカムラ'}
    name_lastname_kana    {'ケイ'}
    birth_day             {'1990-10-03'}
  end
end