class MockModels {
  ///Endpoint : product-service/get-products
  static const String productDataResponse = '''
{
   "status":200,
   "success":true,
   "message":"Product list retrieved successfully.",
   "products":[
      {
         "id":1,
         "product_name":"PlayStation 5",
         "thumbnail":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5l0FIb-69eoJixW5cqeucD2l0f14NzLDFQw&s",
         "price_label":499.99,
         "store":{
            "store_id":101,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"GameWorld",
            "address":"123 Game St, Seattle, WA"
         },
         "description":"The PlayStation 5 is an advanced gaming console that offers stunning graphics and fast load times. With its powerful hardware and innovative features like haptic feedback and adaptive triggers on the DualSense controller, it delivers an immersive gaming experience that keeps players engaged for hours. Enjoy exclusive titles and backward compatibility with a vast library of PS4 games, making it a versatile addition to your entertainment setup."
      },
      {
         "id":2,
         "product_name":"Xbox Series X",
         "thumbnail":"https://cms-assets.xboxservices.com/assets/bc/40/bc40fdf3-85a6-4c36-af92-dca2d36fc7e5.png?n=642227_Hero-Gallery-0_A1_857x676.png",
         "price_label":499.99,
         "store":{
            "store_id":102,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Gamer's Paradise",
            "address":"456 Console Ave, Austin, TX"
         },
         "description":"The Xbox Series X is the most powerful gaming console to date, offering superior performance with its custom-designed processor. Backwards compatibility allows players to enjoy thousands of games from previous generations. With features like Quick Resume and Smart Delivery, the Xbox Series X ensures a seamless gaming experience. Engage in online multiplayer and enjoy stunning cross-platform gameplay with friends."
      },
      {
         "id":3,
         "product_name":"Nintendo Switch",
         "thumbnail":"https://m.media-amazon.com/images/I/51Gz7IimgoL.jpg",
         "price_label":299.99,
         "store":{
            "store_id":103,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"GameWorld",
            "address":"789 Play Rd, San Francisco, CA"
         },
         "description":"The Nintendo Switch is a revolutionary hybrid gaming console that can transform between handheld and home gaming. With its unique design, gamers can play anywhere, anytime. A diverse library of games ranging from classic Mario adventures to immersive RPGs makes the Switch appealing for gamers of all ages. Its portable nature, combined with the cooperative gaming experience for family and friends, makes it a must-have in any gaming collection."
      },
      {
         "id":4,
         "product_name":"4K Ultra HD TV",
         "thumbnail":"https://res.cloudinary.com/sharp-consumer-eu/image/fetch/w_1100,f_auto,q_auto/https://s3.infra.brandquad.io/accounts-media/SHRP/DAM/origin/c0f32290-4766-11ee-80cd-4a0290348580.jpg",
         "price_label":999.99,
         "store":{
            "store_id":104,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Home Electronics",
            "address":"321 Home Lane, Los Angeles, CA"
         },
         "description":"Experience stunning visuals with the 4K Ultra HD TV, which brings your favorite shows and movies to life with impeccable clarity. With advanced picture processing technology and high dynamic range (HDR), this television delivers vibrant colors and deep contrast for cinematic viewing. The smart features allow seamless streaming from various content providers, turning your living room into an entertainment hub."
      },
      {
         "id":5,
         "product_name":"Gaming Laptop",
         "thumbnail":"https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/alienware-notebooks/alienware-x16-r1-intel/media-gallery/gray/notebook-alienware-x16-gray-gallery-4.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=680&qlt=100,1&resMode=sharp2&size=680,402&chrss=full",
         "price_label":1299.99,
         "store":{
            "store_id":105,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Tech Store",
            "address":"555 Tech Blvd, Silicon Valley, CA"
         },
         "description":"The Gaming Laptop is designed for gamers who demand high performance and mobility. With powerful graphics cards and fast processors, it can handle the latest games at high settings without breaking a sweat. The sleek design and advanced cooling systems keep it running smoothly during extensive gaming sessions, while the high-resolution display ensures that every detail of your game is crystal clear."
      },
      {
         "id":6,
         "product_name":"Gaming Headset",
         "thumbnail":"https://gadgetasia.lk/wp-content/uploads/2024/07/monster-rgb-gaming-headset-best-price-gadget-asia-lk-sri-lanka.webp",
         "price_label":99.99,
         "store":{
            "store_id":106,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Audio Hub",
            "address":"678 Audio St, Chicago, IL"
         },
         "description":"Immerse yourself in the game with the Gaming Headset, which features surround sound technology for an enveloping audio experience. Comfortable and lightweight, it ensures hours of gaming without discomfort. The noise-canceling microphone allows clear communication with teammates, while customizable RGB lighting adds flair to your gaming setup."
      },
      {
         "id":7,
         "product_name":"External SSD",
         "thumbnail":"https://laptopcare.lk/wp-content/uploads/2024/08/Untitled-design-34-1.jpg",
         "price_label":149.99,
         "store":{
            "store_id":107,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Tech World",
            "address":"321 Silicon Ave, Mountain View, CA"
         },
         "description":"The External SSD provides lightning-fast data transfer speeds and ample storage space, making it perfect for gamers and professionals alike. Compact and portable, it easily fits into a backpack, allowing you to take your important files wherever you go. With durable construction, it withstands daily use and provides reliable performance."
      },
      {
         "id":8,
         "product_name":"VR Headset",
         "thumbnail":"https://lifemobile.lk/wp-content/uploads/2023/06/Virtual-Reality-Headset.jpg",
         "price_label":349.99,
         "store":{
            "store_id":108,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Virtual Reality Hub",
            "address":"789 VR Blvd, New York, NY"
         },
         "description":"Dive into new worlds with the VR Headset, which offers an immersive virtual reality experience. Featuring high-resolution displays and advanced motion sensors, it tracks your movements in real-time, creating lifelike experiences for gaming and adventures. Compatible with a wide range of VR content, it’s the gateway to thrilling experiences that you can enjoy from the comfort of your home."
      },
      {
         "id":9,
         "product_name":"Smartphone",
         "thumbnail":"https://edgemobile.lk/wp-content/uploads/2024/09/Apple-iPhone-16-finish-lineup-geo-240909_big.jpg.large_.jpg",
         "price_label":999.99,
         "store":{
            "store_id":109,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Mobile World",
            "address":"123 Mobile Ave, Boston, MA"
         },
         "description":"The latest Smartphone combines cutting-edge technology with sleek design. Featuring a powerful processor, stunning display, and advanced camera system, it allows users to capture high-quality photos and videos. With extensive app support and long-lasting battery life, it is perfect for multitasking and staying connected on the go."
      },
      {
         "id":10,
         "product_name":"Smartwatch",
         "thumbnail":"https://m.media-amazon.com/images/I/71pBtMd2vjL.jpg",
         "price_label":199.99,
         "store":{
            "store_id":110,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Gadget Store",
            "address":"456 Gadget Lane, Miami, FL"
         },
         "description":"The Smartwatch is not just a timepiece but a powerful companion for your daily activities. With fitness tracking, heart rate monitoring, and sleep analysis, it helps you maintain a healthy lifestyle. Notifications from your smartphone keep you updated, and customizable watch faces let you Express your style."
      },
      {
         "id":11,
         "product_name":"Xbox Series X Controller",
         "thumbnail":"https://assets.xboxservices.com/assets/bb/bb/bbbb4545-ab47-4d89-81cc-41ed7849b438.jpg?n=444793_Gallery-0_1_1350x759.jpg",
         "price_label":59.99,
         "store":{
            "store_id":102,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Gamer's Paradise",
            "address":"456 Console Ave, Austin, TX"
         },
         "description":"The Xbox Series X Controller is designed for performance and comfort. With customizable button mapping and textured grips, it enhances your gaming experience. The connectivity options provide flexibility for wired or wireless play, making it an ideal choice for competitive gamers."
      },
      {
         "id":12,
         "product_name":"PlayStation DualSense Controller",
         "thumbnail":"https://i0.wp.com/xclusive.lk/wp-content/uploads/DualSense-VolcanicRed-Hero-1-NEW-1.webp?fit=400%2C400&ssl=1",
         "price_label":69.99,
         "store":{
            "store_id":101,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"GameWorld",
            "address":"123 Game St, Seattle, WA"
         },
         "description":"The PlayStation DualSense Controller introduces groundbreaking haptic feedback and adaptive triggers that provide an unprecedented level of immersion in gameplay. It features a built-in microphone, easy-access controls, and a sleek design that fits comfortably in your hands, allowing players to experience their games like never before."
      },
      {
         "id":13,
         "product_name":"Wireless Earbuds",
         "thumbnail":"https://images-cdn.ubuy.qa/649d6af87ff8a12a1b0bc8db-wireless-earbuds-bluetooth-5-3-earbuds.jpg",
         "price_label":129.99,
         "store":{
            "store_id":106,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Audio Hub",
            "address":"678 Audio St, Chicago, IL"
         },
         "description":"These Wireless Earbuds offer a seamless listening experience with advanced Bluetooth connectivity and long battery life. Designed for comfort, they fit snugly in your ears, allowing you to enjoy your favorite music or podcasts without interruptions. The built-in microphone ensures clear calls, making them an ideal choice for music lovers and busy professionals alike."
      },
      {
         "id":14,
         "product_name":"Home Theater System",
         "thumbnail":"https://m.media-amazon.com/images/I/81B-OElKNRL._AC_UF894,1000_QL80_.jpg",
         "price_label":799.99,
         "store":{
            "store_id":104,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Home Electronics",
            "address":"321 Home Lane, Los Angeles, CA"
         },
         "description":"Transform your living space into a cinema with the Home Theater System. Featuring surround sound speakers, a powerful subwoofer, and smart connectivity options, it enhances your movie nights and gaming sessions. With easy setup and compatibility with various devices, it brings your entertainment to life with rich, immersive audio."
      },
      {
         "id":15,
         "product_name":"Gaming Chair",
         "thumbnail":"https://m.media-amazon.com/images/I/71DlNwhYT1L.jpg",
         "price_label":199.99,
         "store":{
            "store_id":105,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Tech Store",
            "address":"555 Tech Blvd, Silicon Valley, CA"
         },
         "description":"The Gaming Chair is designed for long hours of comfortable gaming. Its ergonomic design supports your posture, while adjustable features allow customization for your ideal sitting position. With high-quality materials and stylish aesthetics, it complements any gaming setup, ensuring you focus on your game without distractions."
      },
      {
         "id":16,
         "product_name":"Portable Bluetooth Speaker",
         "thumbnail":"https://xmobile.lk/wp-content/uploads/2023/09/JBL-Boombox-3-Wi-Fi-Portable-Bluetooth-Speaker-1.png",
         "price_label":49.99,
         "store":{
            "store_id":106,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Audio Hub",
            "address":"678 Audio St, Chicago, IL"
         },
         "description":"Enjoy music on the go with the Portable Bluetooth Speaker, which delivers exceptional sound quality in a compact package. With long battery life and water-resistant design, it’s perfect for parties, picnics, or just relaxing at home. Its wireless connectivity allows easy pairing with your devices, providing a listening experience that fits any lifestyle."
      },
      {
         "id":17,
         "product_name":"Fitness Tracker",
         "thumbnail":"https://www.sbsmobile.com/bel/294162-thickbox_default/vital-fit-en.jpg",
         "price_label":99.99,
         "store":{
            "store_id":110,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Gadget Store",
            "address":"456 Gadget Lane, Miami, FL"
         },
         "description":"The Fitness Tracker is an essential device for those looking to monitor their health and fitness levels. It tracks your steps, heart rate, and sleep patterns, helping you stay motivated and informed about your fitness journey. With a sleek design and easy-to-use interface, it seamlessly integrates into your daily routine."
      },
      {
         "id":18,
         "product_name":"4TB External Hard Drive",
         "thumbnail":"https://www.sense.lk/images/uploads/product/40667_4772_SEAGATE-4TB-EXPANSION.png",
         "price_label":129.99,
         "store":{
            "store_id":107,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Tech World",
            "address":"321 Silicon Ave, Mountain View, CA"
         },
         "description":"The 4TB External Hard Drive offers ample storage for all your documents, photos, and videos. Its compact and portable design makes it easy to carry, while fast data transfer speeds ensure efficiency. It is compatible with both Mac and PC, making it a versatile storage solution for home and office use."
      },
      {
         "id":19,
         "product_name":"Streaming Stick",
         "thumbnail":"https://images.thdstatic.com/productImages/b7ea5f26-42b0-4184-b45f-18e35c1acbe6/svn/black-roku-media-streaming-devices-3821r2-64_600.jpg",
         "price_label":39.99,
         "store":{
            "store_id":104,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Home Electronics",
            "address":"321 Home Lane, Los Angeles, CA"
         },
         "description":"The Streaming Stick transforms your TV into a smart entertainment system, allowing you to stream movies and shows from your favorite apps. Easy-to-install and compatible with most televisions, it offers a convenient way to access a wide variety of content. The compact design ensures it blends into your setup without clutter."
      },
      {
         "id":20,
         "product_name":"Gaming Keyboard",
         "thumbnail":"https://m.media-amazon.com/images/I/71fRP7KY9hL._AC_SL1500_.jpg",
         "price_label":89.99,
         "store":{
            "store_id":105,
            "store_logo":"https://img.freepik.com/free-vector/mobile-store-logo-design_23-2149715029.jpg",
            "store_name":"Tech Store",
            "address":"555 Tech Blvd, Silicon Valley, CA"
         },
         "description":"Elevate your gaming experience with the Gaming Keyboard, featuring customizable RGB lighting and responsive keys for fast gameplay. Its ergonomic design ensures comfort during extended sessions, while programmable keys allow for efficient macro commands. A must-have for serious gamers looking to enhance their skills."
      }
   ]
}
  ''';
}
