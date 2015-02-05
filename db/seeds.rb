
# Sample Users
root = User.create(username: 'root', email: 'root@freaktags.com', password: 'seinfeld23', name: 'Root', birthday: Date.parse('1994-03-07'), gender: Gender::MALE, confirmed_at: DateTime.now, role: UserRole::ROOT)
test = User.create(username: 'test', email: 'test@freaktags.com', password: 'smallville23', name: 'Test', birthday: Date.parse('1996-02-16'), gender: Gender::FEMALE, confirmed_at: DateTime.now, role: UserRole::REGULAR)

# Sample friendship
root.invite test
test.approve root
