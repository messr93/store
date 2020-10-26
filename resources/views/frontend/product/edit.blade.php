@extends('layouts.profile')
@section('profile-content')

    <form action="{{ route('product.update', $product->slug) }}" method="post" id="add_product" enctype="multipart/form-data">@csrf @method('put')
        <div class="form-group">
            <select name="category" id="category" class="form-control category @error('category') is-invalid @enderror">
                <option value="{{ $product->category }}">{{ $product->categ->name }}</option>
                @foreach($categories as $category)
                    @continue($category->slug == $product->category)
                    <option value="{{ $category->slug }}">{{ $category->name }}</option>
                @endforeach
            </select>
            @error('category')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group">
            <input type="text" class="form-control name @error('name') is-invalid @enderror" id="name" name="name" placeholder="Product name" value="{{ $product->name }}">
            @error('name')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group form-row">
            <div class="col">
                <input type="number" class="form-control price @error('price') is-invalid @enderror" id="price" name="price" placeholder="Product price" value="{{ $product->price }}">
                @error('price')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
            <div class="col">
                <input type="number" class="form-control discount @error('discount') is-invalid @enderror" id="discount" name="discount" placeholder="Product discount %" value="{{ $product->discount }}">
                @error('discount')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control details @error('details') is-invalid @enderror" id="details" name="details" placeholder="Product details" value="{{ $product->details }}">
            @error('details')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group">
            <textarea class="form-control description @error('description') is-invalid @enderror" id="description" name="description" placeholder="Product description" rows="10">{{ $product->description }}</textarea>
            @error('description')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="form-group">
            <label for="photo"><strong>Select cover photo (1200x700):</strong></label>
            <input type="file" class="form-control-file border @error('photo') is-invalid @enderror" id="photo" name="photo">
            @error('photo')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div id="photo_gallery">
            <span><img src="{{ url('uploads/product/cover/255x255/'.$product->photo) }}" style='width: 150px; height: 150px; margin: 0 10px 10px 0'></span>
        </div>

        <div class="form-group">
            <label for="related_photo"><strong>Select related photos (600x600):</strong></label>
            <input type="file" class="form-control-file border @error('related_photo.*') is-invalid @enderror" id="related_photo" name="related_photo[]" multiple>
            @error('related_photo.*')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div id="related_photo_gallery">
            @foreach($product->relatedPhotos as $relatedPhoto)
                <div class="old_related_photo d-inline-block" style="position: relative">
                    <img src="{{ url('uploads/product/related/600x600/'.$relatedPhoto->photo) }}" style='width: 150px; height: 150px; margin: 0 10px 10px 0'>
                    <button id="{{ $relatedPhoto->id }}" type="button" class="close remove_related_photo" style="position: absolute; top:1px; right:10px">&times;</button>
                </div>
            @endforeach
        </div>

        <input type="hidden" id="deleted_related_photos" name="deleted_related_photos" value="empty">       {{--Deleted related photos id here in array--}}

        <button class="btn btn-primary btn-block">Update</button>
    </form>

@endsection

@push('js')
<script>
    $(document).ready(function(){
        var deleted_related_photos = [];

        //////////////////////////////////////////////// Begin Handle deleted_related_photos /////////////////////////////////

        $(document).on('click', '.remove_related_photo', function(){
            var photoId = $(this).attr('id');

            $(this).parents('.old_related_photo').remove();
            deleted_related_photos.push(photoId);
            $('#deleted_related_photos').val(deleted_related_photos)
            console.log($('#deleted_related_photos').val());
        });

        //////////////////////////////////////////////// End Handle deleted_related_photos /////////////////////////////////

        //////////////////////////////////////////////// Begin show selected related Photos /////////////////////////////////
        function readURL(input) {
            var images_album = $('#related_photo_gallery');
            //$(images_album).empty();

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
