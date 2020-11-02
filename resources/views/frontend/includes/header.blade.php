<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> info@store.com</li>
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
                            <div class="dropdown d-inline-block">
                                <a href="#" style="position: relative; margin-right: 20px; color:black" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-bell" style="font-size: larger; color:#7fad39"></i>
                                    @if(auth()->user()->unreadNotifications->count() > 0)
                                        <i class="badge badge-pill badge-danger notify_count" style="position: absolute; right:10px; top: 2px; font-size: 9px">
                                            {{ auth()->user()->unreadNotifications->count() }}
                                        </i>
                                    @endif
                                 </a>
                                <div class="dropdown-menu dropdown-menu-right mt-3" id="notify_menu">
                                    @foreach(auth()->user()->notifications()->orderBy('created_at', 'desc')->get() as $notification)
                                        @if(is_null($notification->read_at))
                                            <a class="dropdown-item notify_link" href="{{ $notification->data['url'] }}" id="{{ $notification->id }}">
                                                <strong class="notify_unread">{{ $notification->data['message'] }}</strong>
                                                <span style="margin-left: 5px; font-size: small">{{ $notification->created_at->diffForHumans() }}</span>
                                            </a>
                                        @else
                                            <a class="dropdown-item notify_link" href="{{ $notification->data['url'] }}" id="{{ $notification->id }}">
                                                <span style="font-weight: 100">{{ $notification->data['message'] }}</span>
                                                <span style="margin-left: 5px; font-size: small">{{ $notification->created_at->diffForHumans() }}</span>
                                            </a>
                                        @endif
                                    @endforeach
                                </div>
                            </div>

                            <div class="header__top__right__language">
                                <img src="{{ url('uploads/user/'.auth()->user()->photo) }}" class="rounded-circle" style="width: 35px; heigh:35px; margin-right: 0px;">
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="{{ route('profile.index') }}">Profile</a></li>
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
                    {{--<a href="{{ url('/') }}"><img src="{{asset('frontend')}}/img/logo.png" alt=""></a>--}}
                    <h2 class="display-4">Logo</h2>
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
                                    @if(auth()->user()->cartItems->count() > 0)
                                         <span>{{ auth()->user()->cartItems->count() }}</span>
                                    @endif
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

@push('js')
    <script>
        $(document).ready(function(){

            //////////////////////////////////////////// mark notification as read ////////////////////////////////////////
            $(document).on('click', '.notify_link', function(){

                if($(this).find('strong.notify_unread').length > 0){        // if notification not marked yet as read

                    var id = $(this).attr('id');
                    $.ajax({
                        url: "{{ route('notification.markAsRead') }}",
                        method: "post",
                        data: {
                            "_token":  "{{ csrf_token() }}",
                            "id": id,
                        },
                        success: function(data){
                            console.log(data.message);
                        },
                        error: function(err){
                            console.log(err);
                        }
                    });
                }
            });

        });
    </script>
@endpush
