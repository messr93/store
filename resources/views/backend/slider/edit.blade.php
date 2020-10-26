@extends('layouts.admin')
@section('content')
    <form action="{{ route('admin.category.update',  $category->id) }}" method="post" enctype="multipart/form-data">@csrf @method('put')

        <div class="form-group">
            <label for="name">{{ __('backend.Category name') }}:</label>
            <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror" placeholder="{{ __('backend.Category name') }}" value="{{ $category->name }}">
            @error('name')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group">
            <label for="name">{{ __('backend.Description') }}:</label>
            <input type="text" id="description" name="description" class="form-control @error('description') is-invalid @enderror" placeholder="{{ __('backend.Description') }}" value="{{ $category->description }}">
            @error('description')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="form-group form-row">
            <div class="col">
                <label for="status">{{ __('backend.Status') }}:</label>
                <select id="status" name="status" class="form-control @error('status') is-invalid @enderror" >
                    <option value="1" {{($category->status==1)? 'selected':''}}>{{__('backend.Active')}}</option>
                    <option value="0" {{($category->status==0)? 'selected':''}}>{{__('backend.unActive')}}</option>
                </select>
                @error('status')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <label for="parent">{{ __('backend.Parent Category') }}:</label>
                <select id="parent" name="parent" class="form-control @error('parent') is-invalid @enderror">
                    <option value="0" {{ $category->parent == 0? 'selected': '' }}>{{ __('backend.None') }}</option>
                    @foreach($mainCategories as $mainCategory)
                        <option value="{{ $mainCategory->id }}" {{ $category->parent == $mainCategory->id? 'selected': '' }}>{{ $mainCategory->name }}</option>
                    @endforeach
                </select>
                @error('parent')
                <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>

        <div class="form-group">
            <label for="photo">{{ __('backend.Category photo') }}</label>
            <input type="file" id="photo" name="photo" class="form-control-file border  @error('photo') is-invalid @enderror">
            @error('photo')
            <span class="text-danger">{{ $message }}</span>
            @enderror
            <div id="photo_gallery">
                <img src="{{ url('uploads/category/600x600/'.$category->photo) }}" style='width: 250px; height: 150px; margin: 10px'>
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
