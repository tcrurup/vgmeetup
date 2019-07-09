user1 = {username: 'trurup', firstname: "tony", lastname: "rurup", email: "tony.rurup@gmail.com", password: 'tactics'}
user2 = {username: 'capplen', firstname: "cody", lastname: "applen", email: "cody.applen@gmail.com", password: 'bingbong'}
user3 = {username: 'nkhan', firstname: "nazif", lastname: "khan", email: "nazif.khan@gmail.com", password: 'listen'}
user4 = {username: 'nlegrand', firstname: "nathan", lastname: "legrand", email: "nathan.legrand@gmail.com", password: 'minime'}

game1 = {title: 'Final Fantasy VII', release_year: 1997}
game2 = {title: 'Banjo Kazooie', release_year: 1998}
game3 = {title: 'Mass Effect 2', release_year: 2010}
game4 = {title: 'Left For Dead 2', release_year: 2009}
game5 = {title: 'LA Noire', release_year: 2011}



tony = User.create(user1)
cody = User.create(user2)
nazif = User.create(user3)
nathan = User.create(user4)

ffvii = Game.create(game1)
banjo = Game.create(game2)
me2 = Game.create(game3)
lfd2 = Game.create(game4)
lanoire = Game.create(game5)

#tony.add_game_to_collection(ffvii)
