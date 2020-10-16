<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Product;
use Faker\Generator as Faker;

$factory->define(Product::class, function (Faker $faker) {
    return [
        'user_id' => \App\User::inRandomOrder()->first()->id,               /// edit this to shop slug ( in future )
        'category_slug' => \App\Category::inRandomOrder()->first()->slug,
        'name' => $faker->unique()->sentence(2),
        'slug' => 'later_'.uniqid(),
        'price' => $faker->numberBetween(100 , 5000),
        'discount' => $faker->numberBetween(3, 35),
        'rating' => $faker->numberBetween(0, 5),
        'description' => $faker->paragraph(3)
    ];
});
