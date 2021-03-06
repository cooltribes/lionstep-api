require 'machinist/active_record'
require 'faker'

User.blueprint(:confirmed) do
  email { "user-#{sn}@gmail.com" }
  password { "password" }
  password_confirmation { "password" }
  confirmed_at { Date.today - 1 }
  confirmation_sent_at { Date.today - 2 }
  profile
end

Admin.blueprint(:confirmed) do
  email { "admin-#{sn}@gmail.com" }
  password { "password" }
  password_confirmation { "password" }
  confirmed_at { Date.today - 1 }
  confirmation_sent_at { Date.today - 2 }
end

Country.blueprint do
  name { Faker::Address.country }
  cc_fips { Faker::Address.country_code }
  cc_iso { Faker::Address.country_code }
  tld { Faker::Address.country_code }
  cities(1) { City.make!(cc_iso: object.cc_iso) }
end

City.blueprint do
  name { Faker::Address.city }
  cc_iso { nil }
end

Profile.blueprint do
  first_name { Faker::Name.first_name }
  last_name {Faker::Name.last_name }
  born_date { Date.today - 30.years }
  country { Country.make! }
  city { object.country.cities.first.name }
end

Contact.blueprint(:email) do
  info { Faker::Internet.email }
  contact_type { 0 }
  privacy { 0 }
  contactable { User.make!(:confirmed) }
end

ProfessionalExperience.blueprint do
  position { Faker::Company.profession }
  organization { Faker::Company.name }
  start_date { Date.today - 10.years }
  end_date { Date.today - 5.years }
  sector { Sector.make! }
  country { Country.make! }
  city { object.country.cities.first.name }
end

AcademicExperience.blueprint do
  academic_area { AcademicArea.make! }
  academic_degree { AcademicDegree.make! }
  institution { Faker::University.name }
  start_date { Date.today - 10.years }
  end_date { Date.today - 5.years }
  minimum_grade { "Minimun" }
  maximum_grade { "Maximun" }
  actual_grade { "Engineer" }
  country { Country.make! }
  city { object.country.cities.first.name }
end

AcademicArea.blueprint do
  name { "Area #{sn}" }
  locale { "es" }
end

AcademicDegree.blueprint do
  name { "Degree #{sn}" }
  locale { "es" }
end

Sector.blueprint do
  name { "Sector #{sn}" }
end

Skill.blueprint do
  name { "Skill #{sn}" }
  locale { "en" }
end

Language.blueprint do
  name { "Language #{sn}" }
end

ExtraActivity.blueprint do
  name { "Extra Activity #{sn}" }
end

TestResult.blueprint do
  extraversion { Faker::Number.between(-3, 3) }
  feeling { Faker::Number.between(-3, 3) }
  introversion { Faker::Number.between(-3, 3) }
  judging { Faker::Number.between(-3, 3) }
  intuition { Faker::Number.between(-3, 3) }
  perceiving { Faker::Number.between(-3, 3) }
  sensing { Faker::Number.between(-3, 3) }
  thinking { Faker::Number.between(-3, 3) }
end