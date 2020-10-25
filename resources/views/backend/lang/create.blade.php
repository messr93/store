@extends('layouts.admin')
@section('content')
    <form action="{{ route('admin.lang.store') }}" method="post">@csrf

        <div class="form-group">
            <label for="name">{{ __('backend.Lang code') }}:</label>
            <input type="text" id="code" name="code" class="form-control @error('code') is-invalid @enderror" placeholder="{{ __('backend.Lang code') }}" value="{{ old('code') }}">
            @error('code')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group">
            <label for="name">{{ __('backend.Lang name') }}:</label>
            <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror" placeholder="{{ __('backend.Lang name') }}" value="{{ old('name') }}">
            @error('name')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group form-row">
            <div class="col">
                <label for="status">{{ __('backend.Status') }}:</label>
                <select id="status" name="status" class="form-control @error('status') is-invalid @enderror" >
                    <option value="1" {{ old('status') == 1? 'selected':'' }}>{{ __('backend.Active') }}</option>
                    <option value="0" {{ old('status') == 0? 'selected':'' }}>{{ __('backend.unActive') }}</option>
                </select>
                @error('status')
                <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>

        <button type="submit" class="btn btn-primary btn-block">{{ __('backend.Insert') }}</button>
    </form>
@endsection

