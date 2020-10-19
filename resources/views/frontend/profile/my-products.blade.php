@extends('layouts.profile')
@section('profile-content')
    <!-- My products Begin -->
    <div class="row">
        <div class="col-12 my-2">
            <a href="{{ route('product.create') }}" class="btn btn-success"><span style="font-weight: bold">+New product</span></a>
        </div>
        <div class="col-lg-12">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Photo</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Discount</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($products as $product)
                        <tr id="{{$product->id}}">
                            <td class="shoping__cart__item">
                                <img src="{{ url('uploads/product/cover/110x110/'.$product->photo) }}" style="height: 100px; width: 100px" alt="">
                            </td>
                            <td class="shoping__cart__item">
                                <strong>{{ $product->name }}</strong>
                            </td>
                            <td class="shoping__cart__price">
                                ${{ $product->price }}
                            </td>
                            <td class="shoping__cart__price">
                                {{ $product->discount }}%
                            </td>
                            <td class="shoping__cart__item__close">
                                <a href="{{ route('product.edit', $product->slug) }}" class="btn btn-info">Edit</a>
                                <button class="btn btn-danger delete_order" id="{{ $product->id }}" name="{{ $product->name }}">Delete</button>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            {{ $products->links() }}
        </div>
    </div>
    <!-- My products End -->
@endsection

@push('js')
<script>
    $(document).ready(function(){
       $(document).on('click', '.delete_order', function(){
          var productId = $(this).attr('id');
          var productName = $(this).attr('name');
          var modal = $('#delete-order-modal');
          $(modal).find('#confirm-delete-message').text('Sure You wanna delete '+productName);
          $(modal).find('#product-id').val(productId);
          $(modal).modal('toggle');
       });
    });
</script>
@endpush
