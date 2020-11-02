@extends('layouts.admin')
@section('content')
    <form action="{{ route('admin.user.store') }}" method="post" enctype="multipart/form-data">@csrf

        <div class="form-group form-row">
            <div class="col">
                <label for="name">{{ __('backend.User name') }}:</label>
                <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror" placeholder="{{ __('backend.User name') }}" value="{{ old('name ')}}">
                @error('name')
                 <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <label for="name">{{ __('backend.User email') }}:</label>
                <input type="email" id="email" name="email" class="form-control @error('email') is-invalid @enderror" placeholder="{{ __('backend.User email') }}" value="{{ old('email') }}">
                @error('email')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>

        <div class="form-group form-row">
            <div class="col">
                <label for="password">{{ __('backend.User password') }}:</label>
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
                    <option value="male" {{(old('gender')=='male')? 'selected':''}}>{{__('backend.Male')}}</option>
                    <option value="female" {{(old('gender')=='female')? 'selected':''}}>{{__('backend.Female')}}</option>
                </select>
                @error('gender')
                <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <label for="status">{{ __('backend.Status') }}:</label>
                <select id="status" name="status" class="form-control @error('status') is-invalid @enderror" >
                    <option value="1" {{(old('status')==1)? 'selected':''}}>{{__('backend.Active')}}</option>
                    <option value="0" {{(old('status')==0)? 'selected':''}}>{{__('backend.unActive')}}</option>
                </select>
                @error('status')
                <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>

        <div class="form-group">
            <label for="all_other_roles">{{__('backend.Add role')}} :</label>
            <select id="all_roles" name="all_roles" class="form-control">
                <option disabled selected>-- {{__('backend.Select new role')}} --</option>
                @foreach($roles as $role)
                    <option class="other-role" id="{{ __("backend.$role") }}"value="{{ $role }}">{{ __("backend.$role") }}</option>
                @endforeach
            </select>
        </div>

        <div id="user_roles" style="margin-bottom: 20px; padding: 2px">
            <div class="p-2 bg-primary d-inline-block rounded mr-2 user-role">
                <i class="mr-1">{{__('backend.customer')}}</i><button id="customer" class="close remove-user-role">x</button>
            </div>
        </div>

        <div class="form-group">
            <label for="photo">{{ __('backend.User photo') }}</label>
            <input type="file" id="photo" name="photo" class="form-control-file border  @error('photo') is-invalid @enderror">
            @error('photo')
            <span class="text-danger">{{ $message }}</span>
            @enderror
            <div id="photo_gallery">

            </div>
        </div>

        <input type="hidden" id="userNewRoles" name="userNewRoles" value="customer">
        <button type="submit" class="btn btn-primary btn-block">{{ __('backend.Insert') }}</button>
    </form>
@endsection

@push('js')
    <script>
        $(document).ready(function(){

            //////////////////////////////////////////////// Begin handling roles /////////////////////////////////
            var userRoles = ['customer'];
            console.log($('#userNewRoles').val())

            $(document).on('click', '.remove-user-role', function(e){                // 1-remove role
                e.preventDefault();
                var roleValue = $(this).attr('id');
                var roleName = $(this).siblings('i').text();

                var index = userRoles.indexOf(roleValue);
                if(index !== -1 && userRoles.length > 1) {    //    remove only if the user has this role  And roles not less than 1
                    userRoles.splice(index, 1);                    // add to remove roles array
                    $('#userNewRoles').val(userRoles);
                    $(this).parents('.user-role').remove();         // remove it's div ( not shown anymore)
                    $('#all_roles').append('<option class="other-role" id="'+roleName+'" value="'+roleValue+'">'+ roleName +'</option>');      // append it to other roles user dont have
                }
                console.log($('#userNewRoles').val())
            });

            //////////////
            $(document).on('change', '#all_roles', function(){                  // 2- Add new role
                var roleValue = $(this).val();
                var roleName = $("#all_roles option[value='"+roleValue+"']").attr('id');
                console.log(roleName)
                var index = userRoles.indexOf(roleValue);

                if(index == -1) {       //add only if the user doesnt have this role
                    userRoles.push(roleValue);
                    $('#userNewRoles').val(userRoles);
                    $(this).find("option[value='" + roleValue + "']").remove();
                    $(this).find("option[disabled]").prop('selected', true);
                    $('#user_roles').append('<div class="p-2 bg-primary d-inline-block rounded mr-2 user-role">\n' +
                        '<i class="mr-1">' + roleName + '</i><button id="' + roleValue + '" class="close remove-user-role">x</button></div>');
                }
                console.log($('#userNewRoles').val())
            });

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
