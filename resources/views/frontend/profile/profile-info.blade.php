@extends('layouts.profile')
@section('profile-content')
    <form action="{{ route('profile.updateInfo') }}" method="post" id="profile-info">@csrf
        <div class="form-group form-row">
            <div class="col-12">
                <label for="name">Full name:</label>
                <input type="text" id="name" name="name" class="form-control name @error('name') is-invalid @enderror" value="{{ $user->name }}" >
                @error('name')
                <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>
        <div class="form-group form-row">
            <div class="col-6">
                <select name="gender" id="gender" class="gender form-control">
                    <option value="{{ ($user->gender == "male")? 'male': 'female' }}">{{ ($user->gender == "male")? 'Male': 'Female' }}</option>
                    <option value="{{ ($user->gender == "male")? 'female': 'male' }}">{{ ($user->gender == "male")? 'Female': 'Male' }}</option>
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>
@endsection
