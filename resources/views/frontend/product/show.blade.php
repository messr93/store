@extends('layouts.main')
@section('content')
    @include('frontend.includes.search-bar')
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"                 {{-- cover photo--}}
                                 src="{{ url('uploads/product/cover/1200x700/'.$product->photo) }}" alt="" style="width: 555px; height: 450px">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="{{ url('uploads/product/cover/1200x700/'.$product->photo) }}"           {{-- keep cover photo in carousel--}}
                                 src="{{ url('uploads/product/cover/1200x700/'.$product->photo) }}" alt="" style="width: 123.75px; height: 123.75px">

                            @foreach($product->relatedPhotos as $relatedPhoto)
                             <img data-imgbigurl="{{ url('uploads/product/related/600x600/'.$relatedPhoto->photo) }}"       {{-- related photos --}}
                                  src="{{ url('uploads/product/related/600x600/'.$relatedPhoto->photo) }}" alt="">
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>{{ $product->name }}</h3>
                        <div class="product__details__rating">
                            @for($index = 0; $index < $product->rating; $index++)
                            <i class="fa fa-star"></i>
                            {{--<i class="fa fa-star-half-o"></i>--}}
                            @endfor
                            <span>({{ $product->reviews->count() }} reviews)</span>
                        </div>
                        <div class="product__details__price">${{ $product->finalPrice() }}</div>
                        <p>{{ $product->description }}.</p>
                        @if($inCart)                    {{--item already in your cart--}}
                            <h3 class="text-success"> This item in your cart </h3>
                        @else
                            @if(auth()->check() && $product->user_id == auth()->user()->id)         {{--you are the owner go edit not buy--}}
                                <a href="{{ route('product.edit', $product->slug) }}" class="primary-btn border-0">Edit</a>
                            @else
                                <form action="{{ route('cart.store', ['product_id' => $product->id]) }}" method="post" class="d-inline-block"> @csrf
                                    <div class="product__details__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" name="qty" value="1">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="primary-btn border-0">ADD TO CARD</button>
                                </form>
                                @endif
                        @endif
                        <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                   aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                   aria-selected="false">Reviews <span>({{ $product->reviews->count() }})</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Information</h6>
                                    <p>{{ $product->description }}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    @foreach($product->reviews as $review)
                                        <div class="review mb-5" style="border-bottom: 1px solid #68807c">
                                            <h6>{{ $review->owner() }}
                                                <span class="ml-5">@for($index = 0; $index < $review->stars; $index++)<i class="fa fa-star" style="color: #EDBB0E"></i>@endfor</span>
                                            </h6>
                                            <p>{{ $review->review }}</p>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
@endsection
