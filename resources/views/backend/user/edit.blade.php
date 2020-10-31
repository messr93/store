@extends('layouts.admin')
@section('content')
    <form action="{{ route('admin.user.update',  $user->id) }}" method="post" enctype="multipart/form-data">@csrf @method('put')

        <div class="form-group form-row">
            <div class="col">
                <label for="name">{{ __('backend.User name') }}:</label>
                <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror" placeholder="{{ __('backend.User name') }}" value="{{ $user->name }}">
                @error('name')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <label for="name">{{ __('backend.User email') }}:</label>
                <input type="email" id="email" name="email" class="form-control @error('email') is-invalid @enderror" placeholder="{{ __('backend.User email') }}" value="{{ $user->email }}">
                @error('email')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>

        <div class="form-group form-row">
            <div class="col">
                <label for="password">{{ __('backend.User update password') }}:</label>
                <input type="password" id="password" name="password" class="form-control @error('password') is-invalid @enderror" placeholder="{{ __('backend.User password') }}">
                @error('password')
                <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <label for="password_confirmation">{{ __('backend.User password_confirmation') }}:</label>
                <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" placeholder="{{ __('backend.User password_confirmation') }}">
            </div>
        </div>

        <div class="form-group form-row">
            <div class="col">
                <label for="gender">{{ __('backend.Gender') }}:</label>
                <select id="gender" name="gender" class="form-control @error('gender') is-invalid @enderror" >
                    <option value="male" {{($user->gender=='male')? 'selected':''}}>{{__('backend.Male')}}</option>
                    <option value="female" {{($user->gender=='female')? 'selected':''}}>{{__('backend.Female')}}</option>
                </select>
                @error('gender')
                 <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <label for="status">{{ __('backend.Status') }}:</label>
                <select id="status" name="status" class="form-control @error('status') is-invalid @enderror" >
                    <option value="1" {{($user->status==1)? 'selected':''}}>{{__('backend.Active')}}</option>
                    <option value="0" {{($user->status==0)? 'selected':''}}>{{__('backend.unActive')}}</option>
                </select>
                @error('status')
                <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>

        <div class="form-group">
            <label for="photo">{{ __('backend.User photo') }}</label>
            <input type="file" id="photo" name="photo" class="form-control-file border  @error('photo') is-invalid @enderror">
            @error('photo')
                <span class="text-danger">{{ $message }}</span>
            @enderror
            <div id="photo_gallery">
                <img src="{{ url('uploads/user/600x350/'.$user->photo) }}" style='width: 250px; height: 150px; margin: 10px'>
            </div>
        </div>

        <button type="submit" class="btn btn-primary btn-block">{{ __('backend.Update') }}</button>
    </form>
@endsection

@push('js')
    <script>
        $(document).ready(function(){

            //////////////////////////////////////////////// Begin show selected cover photo /////////////////////////////////
            function readURLCover(input) {
                var images_album = $('#photo_gallery');
                //$(images_album).empty();

                if (input.files && input.files[0] && input.files[0]['type'].includes('image/')) {
                    var reader= new FileReader();
                    reader.onload = function(e) {
                        $(images_album).html("<img src="+e.target.result+" style=\'width: 250px; height: 150px; margin: 10px\'>");
                    }
                    reader.readAsDataURL(input.files[0]); // convert to base64 string
                }
            }

            $(document).on('change', '#photo', function(){
                readURLCover(this);
            })

            ///////////////////////////////////////// End show selected cover photo /////////////////////////////////////////////////////////

        });
    </script>
@endpush
