<template>
    <div>
      <form method="GET">
        <div class="relative text-gray-400">
          <span class="absolute inset-y-0 left-0 flex items-center pl-2">
            <button type="submit" class="p-1 focus:outline-none focus:shadow-outline">
              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" class="w-6 h-6"><path d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
            </button>
          </span>
          <input :value="modelValue" @input="$emit('update:modelValue', $event.target.value)" type="text" name="query" class="w-full py-2 text-sm rounded-full pl-10 focus:outline-none" placeholder="Search" autocomplete="off">
        </div>
      </form>
    </div>
</template>

<script>
export default {
  name: 'SearchInput',
  props: ['modelValue'],
  emits: ['update:modelValue']
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}

input {
  background-color: #F7F7F7;
}
</style>
