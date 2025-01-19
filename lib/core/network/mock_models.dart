class MockModels {
  ///Endpoint : product-service/get-products
  static const String productDataResponse = '''
    {
   "status": 200,
   "success": true,
   "message": "Product list retrieved successfully.",
   "products": [
      {
         "id": 1,
         "product_name": "PlayStation 5",
         "thumbnail": "https://cdn.pixabay.com/photo/2020/11/23/14/14/playstation-5-5768350_960_720.jpg",
         "price_label": 499.99,
         "store": {
            "store_id": 101,
            "store_name": "GameWorld",
            "address": "123 Game St, Seattle, WA"
         }
      },
      {
         "id": 2,
         "product_name": "Xbox Series X",
         "thumbnail": "https://upload.wikimedia.org/wikipedia/commons/f/f1/Xbox_Series_X_and_Series_S_2020.jpg",
         "price_label": 499.99,
         "store": {
            "store_id": 102,
            "store_name": "Gamer's Paradise",
            "address": "456 Console Ave, Austin, TX"
         }
      },
      {
         "id": 3,
         "product_name": "Nintendo Switch",
         "thumbnail": "https://upload.wikimedia.org/wikipedia/commons/0/0c/NintendoSwitchLogo.svg",
         "price_label": 299.99,
         "store": {
            "store_id": 103,
            "store_name": "GameWorld",
            "address": "789 Play Rd, San Francisco, CA"
         }
      },
      {
         "id": 4,
         "product_name": "4K Ultra HD TV",
         "thumbnail": "https://res.cloudinary.com/sharp-consumer-eu/image/fetch/w_1100,f_auto,q_auto/https://s3.infra.brandquad.io/accounts-media/SHRP/DAM/origin/c0f32290-4766-11ee-80cd-4a0290348580.jpg",
         "price_label": 999.99,
         "store": {
            "store_id": 104,
            "store_name": "Home Electronics",
            "address": "321 Home Lane, Los Angeles, CA"
         }
      },
      {
         "id": 5,
         "product_name": "Gaming Laptop",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/08/05/00/12/computer-2586964_960_720.jpg",
         "price_label": 1299.99,
         "store": {
            "store_id": 105,
            "store_name": "Tech Store",
            "address": "555 Tech Blvd, Silicon Valley, CA"
         }
      },
      {
         "id": 6,
         "product_name": "Gaming Headset",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/08/05/00/12/computer-2586964_960_720.jpg",
         "price_label": 99.99,
         "store": {
            "store_id": 106,
            "store_name": "Audio Hub",
            "address": "678 Audio St, Chicago, IL"
         }
      },
      {
         "id": 7,
         "product_name": "External SSD",
         "thumbnail": "https://cdn.pixabay.com/photo/2016/12/28/09/34/ssd-1932777_960_720.jpg",
         "price_label": 149.99,
         "store": {
            "store_id": 107,
            "store_name": "Tech World",
            "address": "321 Silicon Ave, Mountain View, CA"
         }
      },
      {
         "id": 8,
         "product_name": "VR Headset",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/01/13/15/22/vr-1972503_960_720.jpg",
         "price_label": 349.99,
         "store": {
            "store_id": 108,
            "store_name": "Virtual Reality Hub",
            "address": "789 VR Blvd, New York, NY"
         }
      },
      {
         "id": 9,
         "product_name": "Smartphone",
         "thumbnail": "https://cdn.pixabay.com/photo/2014/09/23/21/23/iphone-458159_960_720.jpg",
         "price_label": 999.99,
         "store": {
            "store_id": 109,
            "store_name": "Mobile World",
            "address": "123 Mobile Ave, Boston, MA"
         }
      },
      {
         "id": 10,
         "product_name": "Smartwatch",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/01/22/12/14/smart-watch-2000998_960_720.jpg",
         "price_label": 199.99,
         "store": {
            "store_id": 110,
            "store_name": "Gadget Store",
            "address": "456 Gadget Lane, Miami, FL"
         }
      },
      {
         "id": 11,
         "product_name": "Xbox Series X Controller",
         "thumbnail": "https://upload.wikimedia.org/wikipedia/commons/8/8c/Xbox_series_X_controller.jpg",
         "price_label": 59.99,
         "store": {
            "store_id": 102,
            "store_name": "Gamer's Paradise",
            "address": "456 Console Ave, Austin, TX"
         }
      },
      {
         "id": 12,
         "product_name": "PlayStation DualSense Controller",
         "thumbnail": "https://upload.wikimedia.org/wikipedia/commons/d/d5/PlayStation_5_DualSense_controller.jpg",
         "price_label": 69.99,
         "store": {
            "store_id": 101,
            "store_name": "GameWorld",
            "address": "123 Game St, Seattle, WA"
         }
      },
      {
         "id": 13,
         "product_name": "Wireless Earbuds",
         "thumbnail": "https://cdn.pixabay.com/photo/2019/09/03/06/54/headphones-4441681_960_720.jpg",
         "price_label": 129.99,
         "store": {
            "store_id": 106,
            "store_name": "Audio Hub",
            "address": "678 Audio St, Chicago, IL"
         }
      },
      {
         "id": 14,
         "product_name": "Home Theater System",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/01/13/15/11/home-cinema-1972166_960_720.jpg",
         "price_label": 799.99,
         "store": {
            "store_id": 104,
            "store_name": "Home Electronics",
            "address": "321 Home Lane, Los Angeles, CA"
         }
      },
      {
         "id": 15,
         "product_name": "Gaming Chair",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/08/05/00/12/computer-2586964_960_720.jpg",
         "price_label": 199.99,
         "store": {
            "store_id": 105,
            "store_name": "Tech Store",
            "address": "555 Tech Blvd, Silicon Valley, CA"
         }
      },
      {
         "id": 16,
         "product_name": "Portable Bluetooth Speaker",
         "thumbnail": "https://cdn.pixabay.com/photo/2016/11/18/16/24/sound-1835461_960_720.jpg",
         "price_label": 49.99,
         "store": {
            "store_id": 106,
            "store_name": "Audio Hub",
            "address": "678 Audio St, Chicago, IL"
         }
      },
      {
         "id": 17,
         "product_name": "Fitness Tracker",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/01/06/22/49/fitness-1952938_960_720.jpg",
         "price_label": 99.99,
         "store": {
            "store_id": 110,
            "store_name": "Gadget Store",
            "address": "456 Gadget Lane, Miami, FL"
         }
      },
      {
         "id": 18,
         "product_name": "4TB External Hard Drive",
         "thumbnail": "https://cdn.pixabay.com/photo/2014/11/20/13/15/hard-disk-540407_960_720.jpg",
         "price_label": 129.99,
         "store": {
            "store_id": 107,
            "store_name": "Tech World",
            "address": "321 Silicon Ave, Mountain View, CA"
         }
      },
      {
         "id": 19,
         "product_name": "Streaming Stick",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/08/01/08/29/technology-2567990_960_720.jpg",
         "price_label": 39.99,
         "store": {
            "store_id": 104,
            "store_name": "Home Electronics",
            "address": "321 Home Lane, Los Angeles, CA"
         }
      },
      {
         "id": 20,
         "product_name": "Gaming Keyboard",
         "thumbnail": "https://cdn.pixabay.com/photo/2017/08/05/00/12/computer-2586964_960_720.jpg",
         "price_label": 89.99,
         "store": {
            "store_id": 105,
            "store_name": "Tech Store",
            "address": "555 Tech Blvd, Silicon Valley, CA"
         }
      }
   ]
}
  ''';
}
