@extends('layouts.main')
@section('content')
    @include('frontend.includes.search-bar')
    <div class="container">
        @include('frontend.includes.flash-messages')
        <h2>My orders</h2>

        <my-orders></my-orders>


    </div>


@endsection

