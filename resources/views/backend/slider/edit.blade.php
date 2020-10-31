@extends('layouts.admin')
@section('content')
    <form action="{{ route('admin.slider.update',  $slider->id) }}" method="post" enctype="multipart/form-data">@csrf @method('put')

        <div class="form-group">
            <label for="title">{{ __('backend.Slider title') }}:</label>
            <input type="text" id="title" name="title" class="form-control @error('title') is-invalid @enderror" placeholder="{{ __('backend.Slider title') }}" value="{{ $slider->title }}">
            @error('title')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group">
            <label for="name">{{ __('backend.Description') }}:</label>
            <input type="text" id="description" name="description" class="form-control @error('description') is-invalid @enderror" placeholder="{{ __('backend.Description') }}" value="{{ $slider->description }}">
            @error('description')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group">
            <label for="title">{{ __('backend.Slider linklink') }}:</label>
            <input type="text" id="link" name="link" class="form-control @error('link') is-invalid @enderror" placeholder="{{ __('backend.Slider link') }}" value="{{ $slider->link }}">
            @error('link')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group">
            <label for="status">{{ __('backend.Status') }}:</label>
            <select id="status" name="status" class="form-control @error('status') is-invalid @enderror" >
                <option value="1" {{($slider->status==1)? 'selected':''}}>{{__('backend.Active')}}</option>
                <option value="0" {{($slider->status==0)? 'selected':''}}>{{__('backend.unActive')}}</option>
            </select>
            @error('status')
             <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group">
            <label for="photo">{{ __('backend.Slider photo') }}</label>
            <input type="file" id="photo" name="photo" class="form-control-file border  @error('photo') is-invalid @enderror">
            @error('photo')
            <span class="text-danger">{{ $message }}</span>
            @enderror
            <div id="photo_gallery">
                <img src="{{ url('uploads/slider/600x350/'.$slider->photo) }}" style='width: 250px; height: 150px; margin: 10px'>
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
