# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Image.delete_all
Image.reset_pk_sequence
Image.create([

{name: 'Грязь', file: 'грязь.jpg', theme_id: 2},
{name: '1+1', file: '1+1.jpeg', theme_id: 2},
{name: 'Братья Систерс', file: 'братья.jpg', theme_id: 2},
{name: 'Залечь на дно в брюгге', file: 'брюге.jpg', theme_id: 3},
{name: 'Волк с Уолл стрит', file: 'волк.jpg', theme_id: 3},
{name: 'День независимости', file: 'день.jpg', theme_id: 4},
{name: 'Голодные игры', file: 'игры.jpg', theme_id: 4},
{name: 'Исчезнувшая', file: 'исчезнувшая.jpg', theme_id: 2},
{name: 'Бойцовский клуб', file: 'клуб.jpg', theme_id: 2},
{name: 'Зеленая книга', file: 'книга.jpg', theme_id: 3},
{name: 'Люди в черном', file: 'мин.jpg', theme_id: 4},
{name: 'Славные парни', file: 'парни.jpg', theme_id: 3},
{name: 'Прибытие', file: 'прибытие.jpg', theme_id: 4},
{name: 'Сквозь снег', file: 'снег.jpg', theme_id: 4},
{name: 'Такси', file: 'такси.jpg', theme_id: 3}
])

Theme.delete_all
Theme.reset_pk_sequence
Theme.create([

{name: "-----"},      # 1 Нет темы
{name: "Драма"},      # 2
{name: "Комедия"},      # 3
{name: "Фантастика"}      # 4
])

User.delete_all
User.reset_pk_sequence
User.create([

{name: "Example User", email: "example@railstutorial.org", password: "222222", password_confirmation: "222222"}
])