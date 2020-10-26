<a href="{{ route('admin.product.edit', ['product' => $id]) }}" class="btn btn-outline-primary" id="{{ $id }}"><i class="fa fa-edit"></i>{{ __('backend.Edit') }}</a>
<button class="btn btn-outline-danger delete-btn" id="{{ $id }}" name="{{$name}}"><i class="fa fa-trash-alt"></i>{{ __('backend.Delete') }}</button>
<button class="btn btn-outline-{{ $status == 1? 'warning':  'success'}} change-status-btn" id="{{$id}}">{{ $status == 1? __('backend.DisActivate'):  __('backend.Activate')}}</button>
