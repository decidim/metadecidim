# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# You can remove the 'faker' gem if you don't want Decidim seeds.
if ENV["HEROKU_APP_NAME"].present?
  ENV["DECIDIM_HOST"] = ENV["HEROKU_APP_NAME"] + ".herokuapp.com"
  ENV["SEED"] = true
end

Decidim.seed!

puts "Making local configurations changes..."

puts "-- Changing the organization's name to Metadecidim"
Decidim::Organization.first.update!(name: 'Metadecidim')

puts "-- Changing the slugs and IDs to correspond with the ones from the menu"
Decidim::ParticipatoryProcess.first.update!(slug: 'Welcome')
Decidim::ParticipatoryProcessGroup.first.update!(id: 76)
Decidim::Assembly.first.update!(slug: 'our-governance')
Decidim::ParticipatoryProcess.last.update!(slug: "news")
Decidim::ParticipatoryProcess.last.components.where(manifest_name: 'blogs').first.update!(id: 1719, name: { en: 'news' })
