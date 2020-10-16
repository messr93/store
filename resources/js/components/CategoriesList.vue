<template>
    <ul id="categ_ul">
        <li v-for="category in categories"><a :href="'search/products?category='+category.slug">{{ category.name}}</a></li>
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
