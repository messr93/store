@extends('layouts.profile')
@section('profile-content')
    <form action="#" method="post" id="shipping-data"> @csrf
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
        <button class="btn btn-primary btn-block" >Update</button>

    </form>
@endsection
