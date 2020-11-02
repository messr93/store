<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');              /// edit this to shop slug ( in future )
            $table->string('category');
            $table->string('name')->unique();
            $table->string('slug')->unique();
            $table->tinyInteger('status')->default(1);
            $table->string('photo')->default('default_img.jpg');
            $table->string('details')->nullable();
            $table->integer('price');
            $table->integer('discount')->default(0);
            $table->integer('rating')->default(0);
            $table->text('description');

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('category')->references('slug')->on('categories')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product');
    }
}
