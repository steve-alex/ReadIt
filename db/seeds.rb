User.destroy_all
Book.destroy_all
Review.destroy_all
ReadingList.destroy_all
ReadingListBook.destroy_all


a = User.create(username: "Steve")
ReadingList.create(user_id: a.id, name: "Currently Reading")
ReadingList.create(user_id: a.id, name: "Finished Reading")
ReadingList.create(user_id: a.id, name: "Wish List")

b = User.create(username: "Matt")
ReadingList.create(user_id: b.id, name: "Currently Reading")
ReadingList.create(user_id: b.id, name: "Finished Reading")
ReadingList.create(user_id: b.id, name: "Wish List")