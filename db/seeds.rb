# Basic needs to run it without headaches

# Sample Users
root = User.create(username: 'root',
                   email: 'root@freaktags.com',
                   password: 'seinfeld23',
                   name: 'Root',
                   birthday: Date.parse('1994-03-07'),
                   gender: Gender::MALE,
                   confirmed_at: DateTime.now,
                   role: UserRole::ROOT)

test = User.create(username: 'test',
                   email: 'test@freaktags.com',
                   password: 'smallville23',
                   name: 'Test',
                   birthday: Date.parse('1996-02-16'),
                   gender: Gender::FEMALE,
                   confirmed_at: DateTime.now,
                   role: UserRole::REGULAR)

# Sample Friendship
root.follow test
test.follow root

# Sample News
news_hello = News.create(author: root,
                         title: 'Hello FreakTags News',
                         slug_line: 'This is just a news example to populate FreakTags Database',
                         content: '<h3>Hello Freaktaggers</h3> <br> Lets have some fun!')

news_hello.tag_list.add("cool","freak","awesome","nice","LoL")
root.tag(news_hello, with: "buzz", on: :tags)
test.tag(news_hello, with: "c00l", on: :tags)
