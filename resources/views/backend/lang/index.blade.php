@extends('layouts.admin')
@section('content')
    <a href="{{route('admin.lang.create')}}" class="btn btn-success my-3"><i class="fa fa-plus"></i> {{ __('backend.Add lang') }}</a>
    <table class="table table-bordered" id="lang-table">
        <thead>
        <tr>
            <th>{{__('backend.Code')}}</th>
            <th>{{__('backend.Name')}}</th>
            <th>{{__('backend.Status')}}</th>
            <th>{{__('backend.Actions')}}</th>
        </tr>
        </thead>
    </table>
    @include('backend.includes.modals')
@endsection

@push('js')
    <script>
        $(document).ready(function(){
            ////////////////////////////////////////// indexing //////////////////////////////////////////
            var table = $('#lang-table').DataTable({
               processing: true,
               serverSide: true,
               ajax: '{!! route('admin.lang.allData') !!}',
               columns:[
                   {data: 'code', name:'code', },
                   {data: 'name', name:'name'},
                   {data: 'status', name:'status'},
                   {data: 'actions', name:'actions', orderable: false},
               ],
                language: {
                   url: '{!! asset("vendor/datatables/lang/".app()->getLocale().".json") !!}'
                },
            });

            ////////////////////////////////////////// Deletion ////////////////////////////////////////////
            $(document).on('click', '.delete-btn', function(e){
               var id = $(this).attr('id');
               var name = $(this).attr('name');

               $('#deletion_modal_title').text( '{{__('backend.Category deletion')}}' );
               $('#deletion_modal_body').text( '{{__('backend.Sure you wanna delete')}} '+name+' ?');
               $('#deletion_modal_id_holder').val(id);
               $('#deletion_modal').modal('show');
            });
                                                    ////////////////
            $(document).on('click', '#deletion_modal_sure_delete', function(){
               var id =  $('#deletion_modal_id_holder').val();
               $.ajax({
                   url: '{!! route('admin.lang.delete') !!}',
                   method: "post",
                   data: {
                       _token: '{{ csrf_token() }}',
                       id: id,
                   },
                   success: function(data){
                        console.log(data.data);
                        $('#deletion_modal').hide();
                        table.ajax.reload();
                   },
                   error: function(err){
                       $('#deletion_modal').modal('hide');
                       $('#error_modal .modal-title').text("server Error");
                       $('#error_modal .modal-body').text(reject.responseJSON.message);
                       $('#error_modal').modal('show');
                   }
               });
            });

            ////////////////////////////////////////// change status //////////////////////////////////////////
            $(document).on('click', '.change-status-btn', function(e){
                var id = $(this).attr('id');

                $.ajax({
                   url: '{!! route('admin.lang.changeStatus') !!}' ,
                    method: "post",
                    data: {
                        id: id,
                        _token: '{{ csrf_token() }}',
                    },
                    success: function(data){
                        console.log('status changed');
                        table.ajax.reload();
                    },
                    error: function(err){
                       console.log(err.responseJSON.message);
                    }
                });
            });
        });
    </script>
@endpush
