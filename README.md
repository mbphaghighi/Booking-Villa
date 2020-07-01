# Laravel-Booking_app

Develope an exclusive villa-booking SPA (Single Program Application) with Laravel/Vue.js which enables users to book desirable villa from a list, check its availability in preferred time, share a review, advertise a case of villa and also having good search capabilities. 

## Getting Started

Clone the project repository by running the command below if you use SSH

```bash
git clone git@github.com:mbphaghighi/Booking-Villa.git
```

If you use https, use this instead

```bash
git clone https://github.com/mbphaghighi/Booking-Villa.git
```

After cloning,run:

```bash
composer install
```

Duplicate `.env.example` and rename it `.env`.
Then update the database properties with your database config.
After that, import the villabooking.sql SQL file into your database engin.

Then run:

```bash
php artisan key:generate
```

## Using the Web App

And finally, start the application:

```bash
php artisan serve
```

and visit [http://localhost:8000/](http://localhost:8000/) to see the application in action.

## Built With

* [Laravel](https://laravel.com) - The PHP Framework For Web Artisans
* [Vue.js](https://vuejs.org) - The Progressive JavaScript Framework

