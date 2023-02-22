<template>
  <div>
    <div class="fondo">
      <Table />
      <Footer />
    </div>
  </div>
</template>

<script>
import Table from './components/table.vue';
import Footer from './components/footer.vue';

export default {
  components: {
    Table,
    Footer
  }
}
</script>