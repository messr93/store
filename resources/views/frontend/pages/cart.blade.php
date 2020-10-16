@extends('layouts.main')
@section('content')
    @include('frontend.includes.search-bar')

    @if($items->count() == 0)
        <h2 class="text-center">Yor shopping cart is empty</h2>
    @else
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="shoping__product">Products</th>
                                <th class="shoping__product">Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($items as $item)
                                <tr id="{{$item->id}}">
                                    <td class="shoping__cart__item">
                                        <img src="{{ url('uploads/product/'.$item->product->photo) }}" style="height: 100px; width: 100px" alt="">
                                        <h5>{{ $item->name }}</h5>
                                    </td>
                                    <td class="shoping__cart__item">
                                        <strong>{{ $item->product->name }}</strong>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${{ $item->price }}
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <input type="number" min="1" class="qty" name="qty" value="{{ $item->qty }}">
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        ${{ $item->price*$item->qty }}
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <form action="{{ route('cart.destroy', $item->id) }}" method="post">@csrf @method('delete')
                                            <button type="submit" style="border: none; background-color: white"><span class="icon_close"></span></button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="{{route('shop.index')}}" class="primary-btn cart-btn"> << CONTINUE SHOPPING</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span id="subtotal">${{ $subTotal }}</span></li>
                            <li>Total <span id="total">${{ $subTotal }}</span></li>             {{--TODO apply coupon here--}}
                        </ul>
                        <a href="{{ route('cart.checkout') }}" class="primary-btn" id="go_checkout">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    @endif
@endsection

@push('js')
<script>
    $(document).ready(function(){
        ///// on quantity changed handle this
       $(document).on('change', '.qty', function(){
           if($(this).val() > 0){               // no minus here
               $.ajax({
                   url: "cart/"+$(this).parents('tr').attr('id'),
                   method: "post",
                   data:{
                       _token: "{{ csrf_token() }}",
                       _method: "PUT",
                       qty: $(this).val()
                   },
                   success: (data)=>{
                       console.log(data);
                       $(this).parents('tr').find('.shoping__cart__total').text('$'+(data.cart.price*data.cart.qty));
                       $('#subtotal').text('$'+data.subTotal);
                       $('#total').text('$'+data.subTotal);
                   },
                   error: (err)=>{
                       console.log('err');
                   }
               });
           }

       });

    });
</script>
@endpush
