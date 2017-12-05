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
    [ 'Walmart',
      'https://sc01.alicdn.com/kf/HTB1ZILxLpXXXXcLXXXXq6xXFXXXC/Wholesale-Smart-Bluetooth-Watch-M26-Wrist-Watch.jpg',
      'Wrist Waterproof Bluetooth Smart Watch Phone Mate For Android Samsung iPhone iOS',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
    [ 'Carrefour',
      'https://upload.wikimedia.org/wikipedia/en/5/53/Beyonce_-_Lemonade_%28Official_Album_Cover%29.png',
      'Beyoncé Lemonade CD Pop',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, true],
    [ 'Macys',
      'https://slimages.macysassets.com/is/image/MCY/products/0/optimized/8817680_fpx.tif?op_sharpen=1&wid=400&hei=489&fit=fit,1&$filterlrg$',
      'Printed Fit & Flare Skirt, Created for Macy\'s',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
    [ 'JCPenney',
      'https://static.carrefourdigital.com.br/medias/sys_master/images/images/hc4/h2b/h00/h00/9271335125022.jpg',
      'Cachepot Echoes em Madeira Maciça 9,9 x 40 x 60 cm Jatobá - Mão e Formão',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false],
    [ 'Ebay',
      'http://s3.amazonaws.com/img.iluria.com/product/4ABFD3/B4E0B6/450xN.jpg',
      'Caneca Cogumelo (Toad) Mario Bros',
      '2017-12-31 10:00'.to_datetime, '2018-01-02 10:00'.to_datetime, false]
]

offers.each do |advertiser_name, url, description, starts_at, ends_at, premium |
  Offer.create(advertiser_name: advertiser_name, url: url, description: description,
               starts_at: starts_at, ends_at: ends_at, premium: premium )
end

