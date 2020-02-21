# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Bahay", password: "test", is_admin: "true")
User.create(username: "Pinar", password: "test", is_admin: "false")
User.create(username: "Maksut", password: "test", is_admin: "false")
User.create(username: "Sevgi", password: "test", is_admin: "true")

Charity.create(user_id: 1, name: "The Sophia Way", image: "https://www.kirklandreporter.com/wp-content/uploads/2016/11/web1_TSW_logo_jpg2-1024x565.jpg", address: "701 1st Street Kirkland, WA 98033", city: "Kirkland")
Charity.create(user_id: 1, name: "Mamma's Hands", image: "https://www.homelessshelterdirectory.org/gallery/16505__kxw.png", address: "po box 40464 Bellevue, WA 98015", city: "Bellevue")
Charity.create(user_id: 4, name: "Jubilee Women's Center", image: "https://www.drizzleandshine.com/uploads/6/5/3/5/65353119/published/jwc.png?1494018134", address: "620 18th Avenue East Seattle, WA 98112", city: "Seattle")
Charity.create(user_id: 4, name: "YWCA Emergency Shelter", image: "https://volunteer.uwkc.org/content/volunteer.uwkc.org/agency/58658.jpg?1474926178?area=agency", address: "1118 Fifth Ave. Seattle, WA 98101", city: "Seattle")

Request.create(user_id: 1, charity_id: 1, expiration_date: "03/01/2020", info: "Salmon, 5 lbs", status: "open" )
Request.create(user_id: 2, charity_id: 2, expiration_date: "03/11/2020", info: "Oatmeal, 10 Servings", status: "pending" )
Request.create(user_id: 3, charity_id: 3, expiration_date: "02/28/2020", info: "Apples, 10 lbs", status: "closed")
Request.create(user_id: 4, charity_id: 4, expiration_date: "03/08/2020", info: "Canned Kidnet Beans, 10 Servings", status: "open")