session.destroy
User.destroy_all
Book.destroy_all
Review.destroy_all
ReadingList.destroy_all
ReadingListBook.destroy_all


a = User.create(username: "Steve", password: "Steve")
ReadingList.create(user_id: a.id, name: "Currently Reading", deletable: false)
ReadingList.create(user_id: a.id, name: "Finished Reading", deletable: false)
ReadingList.create(user_id: a.id, name: "Wish List", deletable: false)

b = User.create(username: "Matt", password:"Matt")
ReadingList.create(user_id: b.id, name: "Currently Reading", deletable: false)
ReadingList.create(user_id: b.id, name: "Finished Reading", deletable: false)
ReadingList.create(user_id: b.id, name: "Wish List", deletable:false)