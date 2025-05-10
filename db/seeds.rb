# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Question.create(body: 'Это вопрос 1', user_id: 1)
# Question.create(body: 'Это вопрос 2', user_id: 2)

question_massiv = [
    {body: 'это вопрос 1', user_id: 1},
    {body: 'это вопрос 2', user_id: 2},
    {body: 'это вопрос 3', user_id: 3},
    {body: 'это вопрос 4', user_id: 4},
    {body: 'это вопрос 5', user_id: 5},
    {body: 'это вопрос 6', user_id: 6},
]

question_massiv.each do |a|
    Question.find_or_create_by!(a)
end 

puts 'успешно выполнено!'