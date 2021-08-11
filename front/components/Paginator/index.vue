<template>
  <nav class="o-paginator">
    <ul class="pagination">
      <li
        v-if="currentPage > 1"
        class=" page-item"
      >
        <a
          class="page-link text-success"
          href="javascript:void(0)"
          @click="prev"
        >前へ</a>
      </li>
      <li
        v-if="currentPage < totalPages"
        class=" page-item"
      >
        <a
          class="page-link text-success"
          href="javascript:void(0)"
          @click="next"
        >次へ</a>
      </li>
    </ul>
  </nav>
</template>
<script lang="ts">
import { defineComponent, ref, SetupContext, watch } from '@nuxtjs/composition-api'

// TODO: Bootstrapのpaginatorコンポーネントに置き換える
export default defineComponent({
  name: 'Paginator',
  props: {
    totalPages: {
      type: Number,
      required: true
    }
  },
  emits: ['page-changed'],
  setup (props, context: SetupContext) {
    const currentPage = ref(1)

    watch(currentPage, () => {
      context.emit('page-changed', currentPage.value)
    })

    const prev = () => {
      if (currentPage.value > 1) {
        currentPage.value--
      }
    }

    const next = () => {
      if (currentPage.value < props.totalPages) {
        currentPage.value++
      }
    }

    return {
      currentPage,
      prev,
      next
    }
  }
})
</script>
<style lang="scss">
.o-paginator {
  .pagination > li > a,
  .pagination > li > a:focus,
  .pagination > li > a:hover,
  .pagination > li > span,
  .pagination > li > span:focus,
  .pagination > li > span:hover {
    border: 1px solid #28a745;
    color: #28a745;
  }
  .pagination > .active > a
  {
    color: #28a745;
  }
}
</style>
