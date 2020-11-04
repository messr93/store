@extends('layouts.main')
@section('content')
    @include('frontend.includes.search-bar')
    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                @foreach($categories as $category)
                                    <li><a href="{{route('category.show', ['category' => $category->slug])}}">{{ $category->name }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <form action="{{ route('search.products') }}" method="post">@csrf
                                    <input type="hidden" name="category_selected" value="{{ isset($categorySelected)? $categorySelected: 'empty' }}">
                                    <div class="form-group form-row">
                                        <div class="col">
                                            <label for="min_price">min price :</label>
                                            <input type="text" id="min_price" name="min_price" class="form-control">
                                        </div>
                                        <div class="col">
                                            <label for="max_price">max price :</label>
                                            <input type="text" id="max_price" name="max_price" class="form-control">
                                        </div>
                                    </div>
                                    <button type="submit" style="border: 0">Search</button>
                                </form>
                            </div>
                        </div>
                        <div class="sidebar__item sidebar__item__color--option">
                            <h4>Colors</h4>
                            <div class="sidebar__item__color sidebar__item__color--white">
                                <label for="white">
                                    White
                                    <input type="radio" id="white">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--gray">
                                <label for="gray">
                                    Gray
                                    <input type="radio" id="gray">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="red">
                                    Red
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="black">
                                    Black
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="blue">
                                    Blue
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--green">
                                <label for="green">
                                    Green
                                    <input type="radio" id="green">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>{{ $count }}</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                     @foreach($products as $product)
                         <div class="col-lg-4 col-md-6 col-sm-6">
                             <a href="{{ route('product.show', $product->slug) }}">
                                <div class="product__item">
                                   <img src="{{ url('uploads/product/cover/255x255/'.$product->photo) }}">
                                    <div class="product__item__text">
                                        <h6>{{ $product->name }}</h6>
                                        @if($product->discount > 0)
                                            <h6 style="text-decoration: line-through; color: grey; margin-bottom: 0px"> {{ $product->price }} </h6>
                                        @endif
                                        <h5>${{ $product->finalPrice() }}</h5>
                                    </div>
                                </div>
                             </a>
                         </div>
                     @endforeach
                    </div>
                    {{ $products->links() }}
                    {{--<div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>--}}
                </div>
            </div>
    </section>
    <!-- Product Section End -->
@endsection
