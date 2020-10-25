<a href="{{ route('admin.category.edit', ['category' => $id]) }}" class="btn btn-outline-primary" id="{{ $id }}">{{ __('backend.Edit') }}</a>
<button class="btn btn-outline-danger delete-btn" id="{{ $id }}" name="{{$name}}">{{ __('backend.Delete') }}</button>
<button class="btn btn-outline-{{ $status == 1? 'warning':  'success'}} change-status-btn" id="{{$id}}">{{ $status == 1? __('backend.DisActivate'):  __('backend.Activate')}}</button>
