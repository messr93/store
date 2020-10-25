@extends('layouts.profile')
@section('profile-content')
    <form action="{{ route('profile.updateInfo') }}" method="post" id="profile-info" enctype="multipart/form-data">@csrf
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
            <div class="col-2   ">
                <select name="gender" id="gender" class="gender">
                    <option value="{{ ($user->gender == "male")? 'male': 'female' }}">{{ ($user->gender == "male")? 'Male': 'Female' }}</option>
                    <option value="{{ ($user->gender == "male")? 'female': 'male' }}">{{ ($user->gender == "male")? 'Female': 'Male' }}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="photo">Update profile picture min (300x300) :</label>
            <input type="file" id="photo" name="photo" class="form-control-file border @error('photo') is-invalid @enderror">
            @error('photo')
                <span class="text-danger">{{ $message }}</span>
            @enderror
            <div id="photo_gallery">
                <img src="{{ url('uploads/user/'.$user->photo) }}" style="width: 150px; height:150px; margin: 10px">
            </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>
@endsection

@push('js')
    <script>
        $(document).ready(function(){

            //////////////////////////////////////////////// Begin show selected cover photo /////////////////////////////////
            function readURLCover(input) {
                var images_album = $('#photo_gallery');
                $(images_album).empty();

                if (input.files && input.files[0] && input.files[0]['type'].includes('image/')) {
                    var reader= new FileReader();
                    reader.onload = function(e) {
                        $(images_album).html("<img src="+e.target.result+" style=\'width: 150px; height: 150px; margin: 0 10px 10px 0\'>");
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
