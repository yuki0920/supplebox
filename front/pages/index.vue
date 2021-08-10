<template>
  <div v-if="product !== null" class="sample">
    Id {{ product.id }}
    <br>
    Title {{ product.title }}
  </div>
</template>

<script lang="ts">
import { defineComponent, useContext, ref } from '@nuxtjs/composition-api'

export default defineComponent({
  setup () {
    // @ts-ignore
    const { $axios } = useContext()
    const product = ref(null)
    const fetchProduct = () => {
      return $axios.get('/api/products/1')
    }

    fetchProduct().then(({ data }) => {
      product.value = data.product
    })

    return {
      product
    }
  }
})
</script>
<style lang="scss" scoped>
.sample {
  font-size: 2rem;
}
</style>
