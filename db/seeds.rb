Message.destroy_all
User.destroy_all
Channel.destroy_all

general = Channel.create(name: 'general')
paris = Channel.create(name: 'paris')
react = Channel.create(name: 'react')
berlin = Channel.create(name: 'berlin')
lunch = Channel.create(name: 'lunch')

charlotte = User.create(email: "charlotte@lunch.com", password: "charlotte")
peter = User.create(email: "peter@lunch.com", password: "peter")

Message.create(user: charlotte, content: "NUMMER ACHT PIZZA NAPOLI", channel: lunch)
Message.create(user: peter, channel: general, content: "I would like a pizza please, and I know this channel is general")
Message.create(user: charlotte, content: "NUMMER ACHT PIZZA NAPOLI", channel: general)
Message.create(user: charlotte, content: "NUMMER ACHT PIZZA FRENCH", channel: paris)
Message.create(user: charlotte, content: "NUMMER ACHT PIZZA REACT", channel: react)
Message.create(user: charlotte, content: "NUMMER ACHT PIZZA CURRYWURST", channel: berlin)
