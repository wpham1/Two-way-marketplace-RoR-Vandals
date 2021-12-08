# T2A2 - VANDALS Marketplace Project

#### Identification of the problem you are trying to solve by building this particular marketplace app and why is it a problem that needs solving?

___________________

The Vandals sticker marketplace is for independent artists and designers that want to create their own artwork and designs to sell to customers looking to embellish their personal belongings to give them their own unique flair. The marketplace aims to connect like-minded individuals that share similar interests through pop-culture, or any kind of design that allows them to express themselves.

Usually independent artists touch-base with customers and sell their merchandise through local markets, art and craft markets, and also Pop Culture events, such as Oz-comic con or Supanova here in Brisbane. And people who go to these events love to buy locally made art works and designs as well. These sorts of markets and events usually have an outstanding booth fee, where the sellers pay a fee upfront to set up their merchandise, and also have to purchase insurance as cover. These fees add up and sellers end up having to cover the costs to make a profit. With my marketplace app I am removing these sorts of fees and sellers can turn a profit easier.

However, with an ongoing pandemic and an unpredictable and undefined finish line, these sorts of markets and events are cancelled, postponed or limited, with a much greater loss in attendance aka, a loss in revenue. As physical, in-person gatherings and events are decreasing, the presence of online commerce increases, as many more people are starting to buy their goods online.

Nowadays selling anything in person has become difficult, so the Vandals Marketplace creates an online platform for anyone to be able to sell their own artwork and designs, specifically as stickers. By having an online marketplace, small scale artists and designers can expand their reach to a global scale, but still maintain their unique identity through their shop.

One problem that exists with similar marketplaces is “branding”. When you buy from Ebay or Amazon, do you really know if it was *from* Ebay or *through* Ebay? Vandals marketplace tries to solve this by giving each artist/designer their own shop-front, so that customers can identify an artist by their individualistic art style. Artists create listings in their shop, and customers can favourite and purchase their work.

I believe that bridging the gap between artists and customers is very important. Artists and designers feel a need to create and consumers want to buy things that they feel resonates with them. Especially in recent times, where physical distancing is a necessity, consumers can happily satisfy themselves from a distance. With the economy spiralling down, creating something that encourages cash flow and can put food on the table for people is an important thing to solve.



### Deployed links (Heroku and Github)

_____________________

## https://vandals-marketplace.herokuapp.com/

## https://github.com/wpham1/stickershop

_____________________

**Purpose**

A creative outlet for like-minded individuals.

A creative solution to blank surfaces.

Connecting artistic individuals with supportive enthusiasts who want to cover up the world with colour and joy, Vandals Sticker Marketplace makes it easier for fans of pop culture to express their love for video games, movies and tv, and artists to spread their imaginative wings.

**Functionality** **/** **features**

First Users must Sign up with an email, username and password to access the website. Users are then able to list designs of their creation onto the marketplace with a price, title, description, size and finish (matte/glossy/transparent), other users are able to purchase these items and also add them into a favourites list as well. Each user has their own Shop that features all their designs, so you can see how different art styles between artists are.


### Target audience

The target audience for my marketplace are artists/designers wanting to make some money selling their designs, and the consumers are people who want to buy stickers that they can relate to or of something that they are interested in like pop culture. People who want to use stickers on their laptops/skateboards/bottles or anything where they can express how they see the world or want to show how much they love something.

### Tech stack (e.g. html, css, deployment platform, etc)

- Ruby on Rails
- Simple Form for registrations with devise
- Devise for user authorisation
- HTML/CSS/SASS for styling
- Heroku for deployment
- Ultrahook for webhook
- Stripe for payments
- S3 image hosting
- Git/Github for version control
- VSCode Editor
- Figma for wireframes

## User Stories

As Jim I love watching Marvel movies and want to show people how much I love it by buying a Thanos themed sticker and putting it on my Laptop.

As Hillary I love to create art and design and want people to fall in love with my art as well.

As Samara I used to go to markets to sell my merchandise but it's too difficult now and I've heard great things about selling online.

As Terry I love going to local arts and crafts markets to find cool local art and now there's not many left, so I can find some on the internet.

As a Skater Punk my friends make fun of me because the bottom of my skateboard is bare! I wish I had some stickers on it to fit in.

As Tod I want to make a little bit of extra side money and I have a few cool design ideas I think other people would like as well.

As Hermione and a mother of three kids, I love surprising them with stickers that they'd love.

As Mrs. White I want to give out rewards to the well behaved students in class with stickers.

As a fan, I love this artists work a lot, so I will show my support by buying their cool sticker designs!



### Wireframes

https://www.behance.net/gallery/132821917/Vandals-Sticker-Marketplace-Wireframes-Figma?


___________________________

### Different high-level components in my app

In my app I have multiple Controllers that interact with the User and stores various data within the Models and these render out to the View. The data from my Models are manipulated by the Controllers which in turn render to the view.

For instance, I've set up Devise with my Simple forms so that my app can authorise Users more easily with Sign Up and Logging in. I have a Home Controller that lists all my Listings from the Model and a Home Page (View) that renders them with Ruby logic so each listing is rendered as a separate card. I've got Restful routes that connect HTTP requests to Controller Actions such as my Listings resource that has a path that helped create my User Shops (/:username/listings) and I accessed the params to do so. My Listings Controller does the bulk of the work as it handles the CRUD of the Listings as well as Stripe Payment, and that connects to another Payments Controller that has a Webhook action and Successful payment action. I did intend to have Shopping Cart functionality but was out of my scope so I decided to do single payments only. I did set up a Shopping Cart [:session] that could << Item listings but I couldn't figure out a way to launch them all into Stripe at once. My Listings controller also controls the Favouriting, and I have a separate view for the Current_User's faves/shop.



### Third Party services

- From static local images I then moved to Amazon S3 for image hosting with a bucket for my app
- Heroku for App Deployment to the cloud
- Ultrahook for initial webhooks for a public endpoint to test the app remotely
- Stripe API for Payment Processing
- Git/hub for Version Control
- Trello for Task management

