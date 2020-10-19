<!-- payment Modal -->
<div class="modal" id="payment-modal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Payment</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <h2>XOXOXO</h2>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>


<!-- Product delete Modal -->
<div class="modal" id="delete-order-modal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Delete product</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <h2 id="confirm-delete-message">Sure You wanna delete this product ?</h2>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <form action="{{ route('product.deleteForVendor') }}" method="post">@csrf @method('delete')
                    <input type="hidden" id="product-id" name="product_id">
                    <button type="submit" class="btn btn-primary" id="confirm-delete">Confirm</button>
                </form>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
