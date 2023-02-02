<template>
  <h1>{{ num }}</h1>
</template>

<script>
import { ref } from 'vue';
  export default {
    setup() {
      let num = ref(18);
      return {
        num,
      };
    }
}
</script>

<style>

</style>
