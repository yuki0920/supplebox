<template>
  <ServiceDescription />
</template>

<script lang="ts">
import ServiceDescription from "../ServiceDescription/index.vue"
export default {
  components: {
    ServiceDescription
  },
  setup() {
    console.log('Hello')
    return {
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
