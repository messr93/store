@extends('layouts.profile')
@section('profile-content')
    <form action="{{ route('profile.changePassword') }}" method="post" id="profile-info">@csrf
        <div class="form-group">
            <label for="current_password">Enter current password</label>
            <input type="password" class="form-control @error('current_password') is-invalid @enderror" name="current_password" id="current_password">
            @error('current_password')
                {{ $message }}
            @enderror
        </div>
        <div class="form-group">
            <label for="new_password">Enter new password</label>
            <input type="password" class="form-control @error('new_password') is-invalid @enderror" name="new_password" id="new_password">
            @error('new_password')
                {{ $message }}
            @enderror
        </div>
        <div class="form-group">
            <label for="new_password_confirmation">Confirm new password</label>
            <input type="password" class="form-control @error('new_password_confirmation') is-invalid @enderror" name="new_password_confirmation" id="new_password_confirmation">
            @error('new_password_confirmation')
                {{ $message }}
            @enderror
        </div>
        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>
@endsection
