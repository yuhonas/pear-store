<template>
  <header class="p-8 mb-6 bg-white">
    <div class="container mx-auto">
      <SearchInput msg="Search"/>
    </div>
  </header>
  <div class="container mx-auto" style="background-color: #fafafb">
    <h1 class="text-5xl font-bold">Results</h1>
    <p class="my-4">Showing 12 of 100</p>
    <div class="flex flex-wrap gap-8">
      <div v-for="(product, index) in products" :key="index" class="basis-1/4" >
        <ProductCard v-bind="product" />
      </div>
    </div>


  </div>
</template>

<script>
/* eslint-disable */
import '@/assets/tailwind.css';
import SearchInput from './components/SearchInput.vue'
import ProductCard from './components/ProductCard.vue'
import products from '../api/db/seeds/take-home-data-facet.json'

export default {
  name: 'App',
  components: {
    SearchInput,
    ProductCard
  },
  data() {
    return {
      products: []
      //products.slice(0,12)
    }
  },
  mounted() {
    fetch('http://localhost:3000/products')
      .then(res => res.json())
      .then(data => this.products = data)
      .catch(err => console.error(err.message))

  }
}
</script>

<style scoped>
#app {
  font-family: "Inter";
  background-color: #FAFAFA;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  /* color: #2c3e50; */
}
header {
  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
}

p {
  color: #777777;
  text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
</style>
