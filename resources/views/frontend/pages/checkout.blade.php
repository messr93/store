@extends('layouts.main')
@section('content')
    @include('frontend.includes.search-bar')
    @include('frontend.includes.flash-messages')

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Shipping Details</h4>
                <form action="{{ route('order.store') }}" method="post" id="order-data"> @csrf
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col">
                                    <div class="checkout__input">
                                        <p>Full Name<span>*</span></p>
                                        <input type="text" name="shipping_full_name" id="shipping_full_name" placeholder="Full name" value="{{ old('shipping_full_name') }}">
                                        @error('shipping_full_name')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>City<span>*</span></p>
                                        <input type="text"  id="city" name="city" value="{{ old('city') }}">
                                        @error('city')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Region<span>*</span></p>
                                        <input type="text"  id="region" name="region" value="{{ old('region') }}">
                                        @error('region')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" class="checkout__input__add" name="address" id="address" placeholder="Address" value="{{ old('address') }}">
                                @error('address')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text"  name="zip_code" id="zip_code" placeholder="Postcode / ZIP" value="{{ old('zip_code') }}">
                                @error('zip_code')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" name="phone" id="phone" placeholder="Phone" value="{{ old('phone') }}">
                                        @error('phone')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text"  name="email" id="email" placeholder="Email" value="{{ old('email') }}">
                                        @error('email')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Order notes</p>
                                <input type="text"  name="notes" id="notes" placeholder="Notes about your order, e.g. special notes for delivery." value="{{ old('notes') }}">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                    @foreach($items as $item)
                                        <li>{{ $item->product->name }} <span>${{ $item['price'] }}</span></li>
                                    @endforeach
                                </ul>
                                <div class="checkout__order__subtotal">Subtotal <span id="subtotal">${{ $subTotal }}</span></div>
                                <div class="checkout__order__total">Minus <span id="minus" class="text-success">-${{ $minus }}</span></div>
                                <div class="checkout__order__total">Total <span id="total">${{ $total }}</span></div>           {{--TODO apply coupon here--}}
                                <div class="form-check">
                                    <label class="form-check-label" for="cash_on_delivery">
                                        <input type="radio" class="form-check-input payment_method" id="cash_on_delivery" name="payment_method" value="cash_on_delivery" checked>Cash on delivery
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label" for="visa">
                                        <input type="radio" class="form-check-input payment_method" id="visa" name="payment_method" value="visa">Visa/MasterCard
                                    </label>
                                </div>
                                @error('payment_method')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                                <button type="submit" class="site-btn" id="place_order">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

@endsection

@push('js')
    <script>
        $(document).ready(function(){
            var paymentMethod = 'cash_on_delivery';

            $(document).on('change', '.payment_method', function(e){            // on payment method change
                paymentMethod = $(this).val();
                if(paymentMethod !== "cash_on_delivery")
                    $('#place_order').text('GO PAYMENT >>');
                else
                    $('#place_order').text('PLACE ORDER');
            });
        });
    </script>
@endpush
