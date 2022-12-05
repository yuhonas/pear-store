<template>
  <div class="product-card max-w-sm rounded overflow-hidden shadow-lg py-4">
    <div class="h-32">
      <img class="w-32 mb-8 mix-blend-multiply m-auto" :src="image" :alt="vendor"> <!-- TODO: Implement image set here for differing resolutions -->
    </div>
    <div class="px-6 py-4">
      <div class="font-bold mb-2">{{ vendor }}</div>
      <p class="text-gray-700 text-base line-clamp-2">{{ title }}</p>
      {{ price }}
      <strong v-if="strikedPrice" class="line-through">{{ strikedPrice }}</strong>
      <hr/>
      Free Shipping
      Free Gift
    </div>
    <div class="px-6 pt-4 pb-2">
      <button class="text-white font-medium py-2 px-4 rounded-full w-full uppercase">View Deal</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ProductCard',
  props: {
    "title": String,
    "price": String,
    "striked-price": String,
    "image": String,
    "vendor": String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/* carbon/White */
.product-card {
  background: #FFFFFF;
  /* card material */

  box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.1),
  0px 2px 4px rgba(0, 0, 0, 0.1);
  border-radius: 24px;
}

strong {
  color: #9C9C9C;
  font-weight: 500;
}
button {
  background-color: #1AB76C;
}
</style>
