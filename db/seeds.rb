require 'smarter_csv'

# Initial Admin
puts "Creating initial user..."
User.create!(email: "admin@lionstep.com", password: "1234567890", password_confirmation: "1234567890",
  confirmed_at: (Date.today - 1), confirmation_sent_at: (Date.today - 2))

#Initial Sectors
puts "Loading initial Sectors..."
sectors_file = File.open("db/data/initial_sectors.csv", "r:utf-8")
SmarterCSV.process(sectors_file, { col_sep: ";"}) do |array|
  Sector.find_or_create_by(array.first)
end
sectors_file.close

#Initial languages
puts "Loading initial Languages..."
languages_file = File.open("db/data/initial_languages.csv", "r:utf-8")
SmarterCSV.process(languages_file) do |array|
  Language.create!(array.first)
end
languages_file.close

#Initial Countries
puts "Loading initial Countries..."
countries_file = File.open("db/data/initial_countries.csv", "r:ISO-8859-5")
options = { key_mapping: {country_name: :name}, col_sep: "\t"}
SmarterCSV.process(countries_file, options) do |array|
  Country.find_or_create_by(array.first)
end
countries_file.close

#Initial Diplomas
puts "Loading initial Degrees..."
degrees_file = File.open("db/data/initial_academic_degrees.csv", "r:utf-8")
SmarterCSV.process(degrees_file) do |array|
  AcademicDegree.find_or_create_by(array.first)
end
degrees_file.close

#Initial Areas
puts "Loading initial Areas..."
areas_file = File.open("db/data/initial_academic_areas.csv", "r:utf-8")
SmarterCSV.process(areas_file, { col_sep: ";"}) do |array|
  AcademicArea.find_or_create_by(array.first)
end
areas_file.close

#Initial Responsibilities
puts "Loading initial Responsibilities..."
respon_file = File.open("db/data/initial_responsibilities.csv", "r:utf-8")
SmarterCSV.process(respon_file) do |array|
  ResponsibilityLevel.find_or_create_by(array.first)
end
respon_file.close

#Initial Universities
puts "Loading initial Universities... "
universities_file = File.open("db/data/initial_universities.csv", "r:utf-8")
SmarterCSV.process(universities_file) do |array|
  University.find_or_create_by(array.first)
end
universities_file.close

#Initial Cities
puts "Loading initial Cities... this take a few minutes..."
cities_file = File.open("db/data/initial_cities.csv", "r:ISO-8859-5")
options = { key_mapping: {city_name: :name} }
SmarterCSV.process(cities_file, options) do |array|
  City.find_or_create_by(array.first)
end
cities_file.close

#Initial Skills
puts "Loading initial Skills... this take a few minutes..."
skills_file = File.open("db/data/initial_skills.csv", "r:utf-8")
SmarterCSV.process(skills_file) do |array|
  Skill.find_or_create_by(array.first)
end
skills_file.close