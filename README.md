# Jungle

A mini e-commerce application built with Rails 4.2. Where users are able to add items to shopping cart and checkout via Stripe Api.

Implement features to include:
* "Sold Out" identifier
* Admin Dashboard with ability to add new categories and products
* User authentication and navbar dynamic render based on session
* Order details page following purchase through Stripe API

Admin users are able to create categories and add new products to the products page.


## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Demo
![Product purchase](https://raw.githubusercontent.com/andyku25/jungle/master/Docs/add-cart-purchase.gif)
![Add new Product/category](https://raw.githubusercontent.com/andyku25/jungle/master/Docs/new_category_product.gif)