@if(session()->has('success'))
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
@endif
@if(session()->has('error'))
    <div class="alert alert-success">
        {{ session('error') }}
    </div>
@endif
