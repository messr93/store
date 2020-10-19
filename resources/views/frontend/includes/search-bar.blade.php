<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All Categories</span>
                    </div>
                    <categories-list></categories-list>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="{{ route('search.products') }}" method="get">
                            <input type="text" name="name" id="search_name" placeholder="What do yo u need?">
                            <input type="hidden" id="search_details" name="details">
                            <input type="hidden" id="search_description" name="description">
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
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

@push('js')
    <script>
        $(document).on('input', '#search_name', function(){
            var searchValue = $(this).val();
            console.log(searchValue);
            $('#search_details').val(searchValue);
            $('#search_description').val(searchValue);
        })
    </script>
@endpush


