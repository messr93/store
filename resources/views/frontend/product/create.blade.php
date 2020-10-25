@extends('layouts.profile')
@section('profile-content')

    <form action="{{ route('product.store') }}" method="post" id="add_product" enctype="multipart/form-data">@csrf
        <div class="form-group">
            <select name="category" id="category" class="form-control category @error('category') is-invalid @enderror">
                <option disabled selected>Select category</option>
                @foreach($categories as $category)
                    <option value="{{ $category->slug }}">{{ $category->name }}</option>
                @endforeach
            </select>
            @error('category')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group">
            <input type="text" class="form-control name @error('name') is-invalid @enderror" id="name" name="name" placeholder="Product name" value="{{ old('name') }}">
            @error('name')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group form-row">
            <div class="col">
                <input type="number" class="form-control price @error('price') is-invalid @enderror" id="price" name="price" placeholder="Product price" value="{{ old('price') }}">
                @error('price')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <input type="number" class="form-control discount @error('discount') is-invalid @enderror" id="discount" name="discount" placeholder="Product discount %" value="{{ old('discount') }}">
                @error('discount')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control details @error('details') is-invalid @enderror" id="details" name="details" placeholder="Product details" value="{{ old('details') }}">
            @error('details')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group">
            <textarea class="form-control description @error('description') is-invalid @enderror" id="description" name="description" placeholder="Product description" rows="10">{{ old('description') }}</textarea>
            @error('description')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group">
            <label for="photo"><strong>Select cover photo min (1200x700):</strong></label>
            <input type="file" class="form-control-file border @error('photo') is-invalid @enderror" id="photo" name="photo">
            @error('photo')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div id="photo_gallery"></div>

        <div class="form-group">
            <label for="related_photo"><strong>Select related  min (600x600):</strong></label>
            <input type="file" class="form-control-file border @error('related_photo.*') is-invalid @enderror" id="related_photo" name="related_photo[]" multiple>
            @error('related_photo.*')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div id="related_photo_gallery"></div>

        <button class="btn btn-primary btn-block">Insert</button>
    </form>

@endsection

@push('js')
<script>
    $(document).ready(function(){
        //////////////////////////////////////////////// Begin show selected related Photos /////////////////////////////////
        function readURL(input) {
            var images_album = $('#related_photo_gallery');
            $(images_album).empty();

            if (input.files && (input.files.length > 0)) {
                var reader;
                for(var i=0; i < input.files.length; i++){
                    if(input.files[i]['type'].includes('image/')){
                        reader= new FileReader();
                        reader.onload = function(e) {
                            $(images_album).append("<img src="+e.target.result+" style=\'width: 150px; height: 150px; margin: 0 10px 10px 0\'>");
                        }
                        reader.readAsDataURL(input.files[i]); // convert to base64 string
                    }
                }

            }
        }
        $("#related_photo").change(function() {
            readURL(this);
        });

        ///////////////////////////////////////// End show selected related Photos /////////////////////////////////////////////////////////

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
        $("#photo").change(function() {
            readURLCover(this);
        });

        ///////////////////////////////////////// End show selected cover photo /////////////////////////////////////////////////////////

    });
</script>
@endpush
