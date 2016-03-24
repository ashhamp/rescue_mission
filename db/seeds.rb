# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

question_1 = Question.create!(title: Faker::Hipster.paragraph(4), description: Faker::Hipster.paragraph(7))

question_2 = Question.create!(title: Faker::Hipster.paragraph(4), description: Faker::Hipster.paragraph(7))

question_3 = Question.create!(title: Faker::Hipster.paragraph(4), description: Faker::Hipster.paragraph(7))

Answer.create!(description: Faker::Hipster.paragraph(7), question: question_1)

Answer.create!(description: Faker::Hipster.paragraph(7), question: question_1)

Answer.create!(description: Faker::Hipster.paragraph(7), question: question_1)

Answer.create!(description: Faker::Hipster.paragraph(7), question: question_2)

Answer.create!(description: Faker::Hipster.paragraph(7), question: question_3)

Answer.create!(description: Faker::Hipster.paragraph(7), question: question_3)
