<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\ProductReview;
use Faker\Generator as Faker;

$factory->define(ProductReview::class, function (Faker $faker) {
    return [
        'product_id' => \App\Product::inRandomOrder()->first()->id,
        'user_id' => \App\User::inRandomOrder()->first()->id,
        'review' => $faker->paragraph,
        'stars' => $faker->numberBetween(0, 5),

    ];
});
