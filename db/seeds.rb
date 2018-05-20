# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.find_by_email("admin@cuongplus.vn")
  User.create(email: 'admin@cuongplus.vn', password: '123456', first_name: "cuong", last_name: 'plus', role: 0)
  puts 'Admin has been populated'
end

ProductCategory.destroy_all

ProductCategory.create(name: "Điện Thoại", position: 1)
ProductCategory.create(name: "Máy Tính Bảng", position: 2)
ProductCategory.create(name: "MacBook", position: 3)
ProductCategory.create(name: "Apple Watch", position: 4)
ProductCategory.create(name: "Phụ kiện", position: 5)

ProductCategory.first.product_types.create(name: "iPhone X", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 1)
ProductCategory.first.product_types.create(name: "iPhone 8 plus", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 2)
ProductCategory.first.product_types.create(name: "iPhone 8", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 3)
ProductCategory.first.product_types.create(name: "iPhone 7s plus", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 4)
ProductCategory.first.product_types.create(name: "iPhone 7s", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 5)
ProductCategory.first.product_types.create(name: "iPhone 7 plus", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 6)
ProductCategory.first.product_types.create(name: "iPhone 7", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 7)
ProductCategory.first.product_types.create(name: "iPhone 6s plus", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 8)
ProductCategory.first.product_types.create(name: "iPhone 6s", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 9)
ProductCategory.first.product_types.create(name: "iPhone 6 plus", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 10)
ProductCategory.first.product_types.create(name: "iPhone 5s", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 11)
ProductCategory.first.product_types.create(name: "iPhone 5", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 12)

ProductCategory.second.product_types.create(name: "iPad Pro 12.9", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 1)
ProductCategory.second.product_types.create(name: "iPad Pro 10.5", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 2)
ProductCategory.second.product_types.create(name: "iPad Wi-Fi", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 3)
ProductCategory.second.product_types.create(name: "iPad Mini", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 4)

ProductCategory.third.product_types.create(name: "MacBook Pro 2017 - 15 inches", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 1)
ProductCategory.third.product_types.create(name: "MacBook Pro 2017 - 13 inches", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 2)
ProductCategory.third.product_types.create(name: "MacBook - 12 inches", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 3)
ProductCategory.third.product_types.create(name: "MacBook Air 2017", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 4)
ProductCategory.third.product_types.create(name: "MacBook Pro 2016 - 15 inches", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 5)
ProductCategory.third.product_types.create(name: "MacBook Pro 2016 - 13 inches", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 6)
ProductCategory.third.product_types.create(name: "MacBook Air 2016", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 7)
ProductCategory.third.product_types.create(name: "MacBook Pro 2015 - 15 inches", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 8)
ProductCategory.third.product_types.create(name: "MacBook Pro 2015 - 13 inches", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 9)
ProductCategory.third.product_types.create(name: "MacBook Air 2015", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 10)


ProductCategory.fourth.product_types.create(name: "Apple Watch 38mm", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 1)
ProductCategory.fourth.product_types.create(name: "Apple Watch 42mm", title: "Mới 100% Chưa Active - (Fullbox: sạc cáp, tai, hộp)", position: 2)

ProductCategory.fifth.product_types.create(name: "Sạc", title: "Mới 100% - chính hãng", position: 1)
ProductCategory.fifth.product_types.create(name: "Tai nghe", title: "Mới 100% - chính hãng", position: 2)
ProductCategory.fifth.product_types.create(name: "Cáp", title: "Mới 100% - chính hãng", position: 3)
ProductCategory.fifth.product_types.create(name: "Dây Apple Watch", title: "Mới 100% - chính hãng", position: 4)

ProductType.all.each do |type|
  type.products.create(name: type.name + ' Black', price: 19000000, position: 1)
  type.products.create(name: type.name + ' Red', price: 19000000, position: 2)
  type.products.create(name: type.name + ' Silver', price: 19000000, position: 3)
  type.products.create(name: type.name + ' White', price: 19000000, position: 4)
  type.products.create(name: type.name + ' Gray', price: 19000000, position: 5)
end








