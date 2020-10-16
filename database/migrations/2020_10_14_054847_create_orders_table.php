<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_number')->unique();
            $table->unsignedBigInteger('user_id');
            $table->enum('status', ['pending', 'processing', 'completed', 'decline'])->default('pending');
            $table->bigInteger('total');
            $table->tinyInteger('coupon_applied')->default(0);
            $table->integer('item_count');
            $table->tinyInteger('paid')->default(0);
            $table->enum('payment_method', ['cash_on_delivery', 'visa', 'paypal']);
            $table->text('payment_id')->nullable();

            $table->string('shipping_full_name');
            $table->string('city');
            $table->string('region');
            $table->text('address');
            $table->integer('zip_code');
            $table->bigInteger('phone');
            $table->string('email');
            $table->text('notes')->nullable();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            /*$table->foreign('city_id')->references('id')->on('cities');
            $table->foreign('region_id')->references('id')->on('regions');*/

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
        Schema::dropIfExists('orders');
    }
}
