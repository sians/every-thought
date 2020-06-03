sian = User.create(email: 'sian.m.stone@gmail.com', password: 'foobar')

list = List.create(name: 'First List', user: sian)

t1 = Thought.create(title: 'repot cuttings', user: sian, list: list)
t2 = Thought.create(title: 'vacuum & sweep room', user: sian, list: list)
t3 = Thought.create(title: 'make cinnamon afternoon teacake', user: sian, list: list)


