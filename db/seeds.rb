# require 'faker'

# # Création des enregistrements de catégorie
# categories = 3.times.map do
#   Category.create(name: Faker::Book.genre)
# end

# # Création des auteurs
# authors = 3.times.map do
#   Author.create(author: Faker::Name.name)
# end

# # Création des articles
# authors.each do |author|
#   2.times do
#     article = author.articles.create(
#       title: Faker::Book.title,
#       body: Faker::Lorem.sentence(word_count: 20),
#       category: categories.sample
#     )
#   end
# end

15.times do
  author = Author.create(author: Faker::Book.author)
  category = Category.create(name: Faker::Book.genre)
  article = Article.create(title: Faker::Book.title,
    author: author,
    category: category,
    body: Faker::Movies::Hobbit.quote
    )
end