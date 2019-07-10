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

genre_rpg = Genre.create(name: 'rpg')
genre_story_rich = Genre.create(name: 'story rich')
genre_turn_based = Genre.create(name: 'turn based')
genre_platforming = Genre.create(name: 'platforming')
genre_adventure = Genre.create(name: 'adventure')
genre_third_person_shooter = Genre.create(name: 'third person shooter')
genre_first_person_shooter = Genre.create(name: 'first person shooter')
genre_action = Genre.create(name: 'action')
genre_cooperative = Genre.create(name: 'cooperative')
genre_survival_horror = Genre.create(name: 'survival horror')


ffvii.add_array_of_genres([genre_rpg, genre_story_rich, genre_turn_based])
banjo.add_array_of_genres([genre_platforming, genre_adventure])
me2.add_array_of_genres([genre_rpg, genre_action, genre_third_person_shooter])
lfd2.add_array_of_genres([genre_cooperative, genre_survival_horror, genre_first_person_shooter])
lanoire.add_array_of_genres([genre_action, genre_adventure, genre_third_person_shooter, genre_story_rich])

tony.add_game_to_collection(ffvii)
cody.add_game_to_collection(ffvii)

cody.post_to_other_users_board("Hey what's going on man?", tony)
