# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@lemonade.com', password: 'Let*sGetInformation', admin: true)
User.create(email: 'anyone@lemonade.com', password: 'Lemmon@pp', admin: false)

offers = [
    [ 'Walmart', 'https://www.walmart.com.br', 'Lorem ipsum',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
    [ 'Carrefour', 'https://www.carrefour.com.br/', 'Sit dolor amet',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
    [ 'Macys', 'https://www.macys.com/', 'Consectetur adipiscing elit',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
    [ 'JCPenney', 'https://www.jcpenney.com/', 'Ut enim ad minim veniam',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
    [ 'Ebay', 'https://www.ebay.com/', 'Excepteur sint occaecat cupidatat non proident',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
]

offers.each do |advertiser_name, url, description, starts_at, ends_at, premium |
  Offer.create(advertiser_name: advertiser_name, url: url, description: description,
               starts_at: starts_at, ends_at: ends_at, premium: premium )
end

