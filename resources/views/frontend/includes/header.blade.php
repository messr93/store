<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                            <li>Free Shipping for all Order of $99</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <img src="{{asset('frontend')}}/img/language.png" alt="">
                            <div>English</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Arabic</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div>
                        @guest()
                            <div class="header__top__right__auth">
                                <a href="{{ route('login') }}" class="d-inline-block"><i class="fa fa-user"></i> Login</a>
                                <a href="{{ route('register') }}" class="d-inline-block">/ Register</a>
                            </div>
                        @else
                            <div class="header__top__right__language">
                                <span class="fa fa-user"> {{ auth()->user()->name }}</span>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Profile</a></li>
                                    <li><a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Logout</a></li>
                                    <form class="d-none" id="logout-form" action="{{route('logout')}}" method="post">@csrf</form>
                                </ul>
                            </div>
                        @endguest
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="{{ url('/') }}"><img src="{{asset('frontend')}}/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="{{ url('/') }}">Home</a></li>
                        <li><a href="{{ route('shop.index') }}">Shop</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="{{asset('frontend')}}/pages/shop-details.html">Shop Details</a></li>
                                <li><a href="{{ route('cart.index') }}">Shoping Cart</a></li>
                                <li><a href="{{asset('frontend')}}/pages/checkout.html">Check Out</a></li>
                                <li><a href="{{asset('frontend')}}/pages/blog-details.html">Blog Details</a></li>
                            </ul>
                        </li>
                        <li><a href="{{asset('frontend')}}/pages/blog.html">Blog</a></li>
                        <li><a href="{{asset('frontend')}}/pages/contact.html">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li>
                            <a href="{{ route('cart.index') }}"><i class="fa fa-shopping-bag"></i>
                                @auth()
                                 <span>{{ auth()->user()->cartItems->count() }}</span>
                                @endauth
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->
