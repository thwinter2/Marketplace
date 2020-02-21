# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', password: 'password', email: 'market5172020@gmail.com',
            phone: '123-456-7890', dob: '1920-01-01', street_addres: '123 Meeting St',
            city: 'Raleigh', state: 'NC', zip: 27606, admin: true)
Item.create(name: 'Banana', brand: 'Chiquita', category: 'Produce', description: 'Yellow fruit that\'s high in ' +
    'potassium.', image: 'https://balaskas.shop/cms/uploads/2018/05/0000020084.jpg', special_item: false,
            age_restricted: false, quantity: 30, cost: 0.49, tax_slab: 'No Tax')
Item.create(name: 'Apple', brand: 'Fuji', category: 'Produce', description: 'A red fruit known for its crunch',
            image: 'https://cdn.shopify.com/s/files/1/2336/3219/products/fuji_x850.jpg?v=1538674924',
            special_item: false, age_restricted: false, quantity: 45, cost: 1.5, tax_slab: 'No Tax')
Item.create(name: 'Sword', brand: 'Medieval', category: 'Weapons', description: 'Melee weapon great for slashing, ' +
    'hacking, maiming, and slicing. Low range but high damage. Looks great with a shield!',
            image: 'https://swordskingdom.com/media/catalog/product/cache/1/thumbnail/1000x/17f82f742ffe127f42dca9de82fb58b1/x/e/xena-warrior-princess-sword.jpg',
            special_item: false, age_restricted: true, quantity: 10, cost: 25.99, tax_slab: 'Weapons Tax')
Item.create(name: 'Bow', brand: 'Medieval', category: 'Weapons', description: 'Ranged weapon great for shooting, ' +
    'aiming, sniping, and skewering. High range but low damage. Looks great with a bunch of arrows!',
            image: 'https://files.knifecenter.com/knifecenter/united/images/UC3031e.jpg',
            special_item: false, age_restricted: true, quantity: 10, cost: 25.99, tax_slab: 'Weapons Tax')
