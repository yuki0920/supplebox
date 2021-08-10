<template>
  <div class="sample">
    <ul>
      <li>{{ value }} is example value</li>
      <li>{{ value }} is example value</li>
      <li>{{ value }} is example value</li>
    </ul>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from '@nuxtjs/composition-api'

export default defineComponent({
  setup () {
    const value = ref('sample')

    return {
      value
    }
  }
})
</script>
<style lang="scss" scoped>
.sample {
  font-size: 2rem;
}
</style>
