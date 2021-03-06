<!-- Assurance Modal -->
<div class="modal" id="deletion_modal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title" id="deletion_modal_title">Title</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" id="deletion_modal_body">
                SomeThing here ....
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <input type="hidden" id="deletion_modal_id_holder">
                <button id="deletion_modal_sure_delete" type="button" class="btn btn-danger" data-dismiss="modal">{{__('backend.Delete')}}</button>
                <button type="button" class="btn btn-success" data-dismiss="modal">{{__('backend.Close')}}</button>
            </div>

        </div>
    </div>
</div>



<!-- Error Modal -->
<div class="modal" id="error_modal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">{{__('backend.Error')}}</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                SomeThing here ....
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">{{__('backend.Close')}}</button>
            </div>

        </div>
    </div>
</div>
