user = User.create(username: "example", email: "example@gmail.com", password_digest: "1234")
ruby = Topic.create(name: "Ruby")
js = Topic.create(name: "JavaScript")
Book.create(title: "Complete Series", format: "ebook", note: "didn't start yet", topic: ruby, user: user)
Book.create(title: "Beginner", format: "hard copy", note: "finished", topic: js, user: user)