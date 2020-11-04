<template>
    <ul id="categ_ul list-group" style="padding: 0px">
        <li class="list-group-item font-weight-bold text-center bg-light" v-for="category in categories"><a class="text-primary" :href="'category/'+category.slug">{{ category.name}}</a></li>
    </ul>
</template>

<script>
    export default {
        mounted() {
            axios.get('category').then((response)=> {
                this.categories = response.data;
                //console.log(response);
            });
        },
        data(){
          return {
              categories: [],
          }
        },
    }
</script>
