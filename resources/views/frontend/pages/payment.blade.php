@extends('layouts.main')
@section('content')
    @include('frontend.includes.search-bar')
    <form action="{{ route('order.finishOrder') }}" class="paymentWidgets" data-brands="VISA MASTER"></form>
    @include('frontend.includes.modals')
@endsection

@push('js')
     <script src="https://test.oppwa.com/v1/paymentWidgets.js?checkoutId={{ $checkoutId }}"></script>
@endpush

