User.destroy_all
Book.destroy_all
Review.destroy_all
ReadingList.destroy_all
ReadingListBook.destroy_all

80.times do
    Book.create(title: Faker::Book.unique.title, authors: Faker::Book.author)
end


a = User.create(username: "Steve")
ReadingList.create(user_id: a.id, name: "Currently Reading")
ReadingList.create(user_id: a.id, name: "Finished Reading")
ReadingList.create(user_id: a.id, name: "Wish List")

b = User.create(username: "Matt")
ReadingList.create(user_id: b.id, name: "Currently Reading")
ReadingList.create(user_id: b.id, name: "Finished Reading")
ReadingList.create(user_id: b.id, name: "Wish List")



100.times do
    ReadingListBook.create(book_id: Book.all.sample.id, reading_list_id: ReadingList.all.sample.id)
end

30.times do
    Review.create(title: Faker::Hipster.sentence, content: Faker::Hipster.paragraph, rating: rand(0..5), user_id: User.all.sample.id, book_id: Book.all.sample.id)
end