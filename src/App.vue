<template>
  <header class="p-8 mb-6 bg-white">
    <div class="container mx-auto">
      <SearchInput v-model="query" />
    </div>
  </header>
  <div class="container mx-auto">
    <h1 class="text-5xl font-bold">Results</h1>
    <p class="my-4">Showing {{ productCount }} of {{ response.count }}</p>
    <div class="flex flex-wrap gap-8">
      <div v-for="(product, index) in products" :key="index" class="basis-1/4" >
        <ProductCard v-bind="product" />
      </div>
    </div>
      <p class="text-center" v-if="response.next">
        <button v-on:click="nextProducts">Show More</button>
      </p>
  </div>
</template>

<script>
/* eslint-disable */
import '@/assets/tailwind.css';
import SearchInput from './components/SearchInput.vue'
import ProductCard from './components/ProductCard.vue'
import debounce from "lodash.debounce";

const API_URL='http://localhost:8000/products'

export default {
  name: 'App',
  components: {
    SearchInput,
    ProductCard
  },
  data() {
    return {
      response: { next: API_URL},
      products: [],
      productCount: 0,
      query: '',
    }
  },
  mounted() {
    this.nextProducts()
  },

  methods: {
    nextProducts: function() {
      fetch(this.response.next)
        .then(res => res.json())
        .then(data => {
          this.response = data
          let resultSet = this.response.results
          this.products = this.products.concat(resultSet)
          this.productCount += resultSet.length
        })
        .catch(err => console.error(err.message)) // TODO: Implement appropriate error page, this will basically fail silently
    },
    searchProducts: debounce(function() {
        fetch('http://localhost:8000/products?q=' + this.query)
          .then(res => res.json())
          .then(data => {
            this.response = data
            this.products = this.response.results
          })
          .catch(err => console.error(err.message))
      }, 200)
  },
  watch: {
    query(value) {
      this.searchProducts()
    }
  }
}
</script>

<style scoped>
* {
  font-family: "Inter";
  /* background-color: #FAFAFA; */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  /* color: #2c3e50; */
  background-color: #fafafb;
}
header {
  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
}

p {
  color: #777777;
  text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
</style>
