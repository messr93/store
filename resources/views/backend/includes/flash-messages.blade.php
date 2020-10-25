@if(session()->has('success'))
    <div class="alert alert-success">
        {{ session()->pull('success') }}
    </div>
@endif
@if(session()->has('error'))
    <div class="alert alert-danger">
        {{ session()->pull('error') }}
    </div>
@endif
