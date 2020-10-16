<template>
    <div class="shoping__cart__table">
        <table v-if="orders.length > 0">
            <thead>
            <tr>
                <th class="shoping__product">Order number</th>
                <th class="shoping__product">Total price</th>
                <th class="shoping__product">status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <tr v-for="order in orders">
                <td class="shoping__cart__item">{{ order.order_number }}</td>
                <td class="shoping__cart__item">{{ order.total}}</td>
                <td class="shoping__cart__item"> {{ order.status }}</td>
                <td class="shoping__cart__item__close" style="width: 250px">
                    <button class="btn btn-info d-inline-block" @click="showDetails(order.id)">Details</button>
                    <button class="btn btn-danger d-inline-block" @click="prepareDeletion(order.id)">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
        <h2 class="text-center" v-else>{{ notFoundMessage }}</h2>


        <!-- The Modal -->
        <div class="modal" id="myModal" v-show="deleteModalShow" style="display: inline-block">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Deleting reason</h4>
                        <button type="button" class="close" data-dismiss="modal" @click="deleteModalShow = false">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <textarea v-bind="deleteReason">Some reasons</textarea>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="deleteOrder()">Send</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" @click="deleteModalShow = false">Close</button>
                    </div>

                </div>
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        mounted() {
            axios.get('my-orders').then((response)=>{
                this.orders = response.data.orders;
            }).catch((err)=>{
                this.notFoundMessage = err.response.data.message;
            });
        },
        methods: {
            showDetails(id){
                window.location.assign('order/'+id);
            },
            prepareDeletion(id){
                this.deleteOrderId = id;
                this.deleteModalShow = true
            },
            deleteOrder(){
                this.deleteModalShow = false;
                if(this.deleteOrderId !== 0){
                    alert('why you soo serious !!');
                }
            }
        },
        data(){
            return{
                orders: [],
                notFoundMessage: '',
                deleteModalShow: false,
                deleteOrderId: 0,
                deleteReason: '',
            }
        }
    }
</script>
