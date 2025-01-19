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
         "thumbnail": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5l0FIb-69eoJixW5cqeucD2l0f14NzLDFQw&s",
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
         "thumbnail": "https://cms-assets.xboxservices.com/assets/bc/40/bc40fdf3-85a6-4c36-af92-dca2d36fc7e5.png?n=642227_Hero-Gallery-0_A1_857x676.png",
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
         "thumbnail": "https://m.media-amazon.com/images/I/51Gz7IimgoL.jpg",
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
         "thumbnail": "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/alienware-notebooks/alienware-x16-r1-intel/media-gallery/gray/notebook-alienware-x16-gray-gallery-4.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=680&qlt=100,1&resMode=sharp2&size=680,402&chrss=full",
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
         "thumbnail": "https://gadgetasia.lk/wp-content/uploads/2024/07/monster-rgb-gaming-headset-best-price-gadget-asia-lk-sri-lanka.webp",
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
         "thumbnail": "https://laptopcare.lk/wp-content/uploads/2024/08/Untitled-design-34-1.jpg",
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
         "thumbnail": "https://lifemobile.lk/wp-content/uploads/2023/06/Virtual-Reality-Headset.jpg",
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
         "thumbnail": "https://edgemobile.lk/wp-content/uploads/2024/09/Apple-iPhone-16-finish-lineup-geo-240909_big.jpg.large_.jpg",
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
         "thumbnail": "https://m.media-amazon.com/images/I/71pBtMd2vjL.jpg",
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
         "thumbnail": "https://assets.xboxservices.com/assets/bb/bb/bbbb4545-ab47-4d89-81cc-41ed7849b438.jpg?n=444793_Gallery-0_1_1350x759.jpg",
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
         "thumbnail": "https://i0.wp.com/xclusive.lk/wp-content/uploads/DualSense-VolcanicRed-Hero-1-NEW-1.webp?fit=400%2C400&ssl=1",
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
         "thumbnail": "https://images-cdn.ubuy.qa/649d6af87ff8a12a1b0bc8db-wireless-earbuds-bluetooth-5-3-earbuds.jpg",
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
         "thumbnail": "https://m.media-amazon.com/images/I/81B-OElKNRL._AC_UF894,1000_QL80_.jpg",
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
         "thumbnail": "https://m.media-amazon.com/images/I/71DlNwhYT1L.jpg",
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
         "thumbnail": "https://xmobile.lk/wp-content/uploads/2023/09/JBL-Boombox-3-Wi-Fi-Portable-Bluetooth-Speaker-1.png",
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
         "thumbnail": "https://www.sbsmobile.com/bel/294162-thickbox_default/vital-fit-en.jpg",
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
         "thumbnail": "https://www.sense.lk/images/uploads/product/40667_4772_SEAGATE-4TB-EXPANSION.png",
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
         "thumbnail": "https://images.thdstatic.com/productImages/b7ea5f26-42b0-4184-b45f-18e35c1acbe6/svn/black-roku-media-streaming-devices-3821r2-64_600.jpg",
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
         "thumbnail": "https://m.media-amazon.com/images/I/71fRP7KY9hL._AC_SL1500_.jpg",
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
