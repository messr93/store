@extends('layouts.main')
@section('content')
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <categories-list></categories-list>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>

                    <div class="hero__item set-bg" data-setbg="{{ url('uploads/slider/1200x700/'.$firstSlider->photo) }}">
                        <div class="hero__text">
                            <span >{{ $firstSlider->title }}</span>
                            <h2 class="text-light">{{ $firstSlider->description }} <br /></h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="{{ $firstSlider->link }}" class="primary-btn">{{__('front.SHOP NOW')}}</a>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- Hero Section End -->

    <!-- sale_off Section Begin -->
    <section class="sale_off">
        <div class="container">
            <div class="section-title"><h2 class="mx-auto my-5">- Sale Off -</h2></div>
            <div class="row">
                <div class="product__discount__slider owl-carousel">
                    @foreach($saleProducts as $product)
                        <div class="col-lg-4">
                            <a href="{{ route('product.show', $product->slug) }}">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="{{ url('uploads/product/cover/1200x700/'.$product->photo) }}">
                                        <div class="product__discount__percent">-{{ $product->discount }}%</div>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>{{ $product->categ->name }}</span>
                                        <h5><a href="#">{{ $product->name }}</a></h5>
                                        <div class="product__item__price">${{ $product->finalPrice() }} <span>${{ $product->price }}</span></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    <!-- sale_off Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>{{ __('front.Featured products') }}</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            @foreach($categories as $index => $category)
                                <li data-filter=".{{ $category->slug }}">{{ $category->name }}</li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                @foreach($featuredProducts as $product)
                    <div class="col-lg-3 col-md-4 col-sm-6 mix {{ $product->categ->slug }}">
                    <a href="{{ route('product.show', $product->slug) }}">
                        <div class="featured__item">
                            <img src="{{ url('uploads/product/cover/255x255/'.$product->photo) }}">
                            <div class="product__item__text">
                                <h6>{{ $product->name }}</h6>
                                <h5>${{ $product->finalPrice() }}</h5>
                            </div>
                        </div>
                    </a>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            @foreach($latestProducts as $chuckProducts)
                                <div class="latest-prdouct__slider__item">
                                    @foreach($chuckProducts as $product)
                                        <a href="{{ route('product.show', $product->slug) }}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="{{ url('uploads/product/cover/110x110/'.$product->photo) }}" alt="" style="height:110px ;width: 110px">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>{{ $product->name }}</h6>
                                                <span>${{ $product->finalPrice() }}</span>
                                            </div>
                                        </a>
                                    @endforeach
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            @foreach($topRatedProducts as $chuckProducts)
                                <div class="latest-prdouct__slider__item">
                                    @foreach($chuckProducts as $product)
                                        <a href="{{ route('product.show', $product->slug) }}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="{{ url('uploads/product/cover/110x110/'.$product->photo) }}" alt="" style="height:110px ;width: 110px">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>{{ $product->name }}</h6>
                                                <span>${{ $product->finalPrice() }}</span>
                                            </div>
                                        </a>
                                    @endforeach
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

@endsection

