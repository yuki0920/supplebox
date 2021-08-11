<template>
  <div
    v-if="isShow"
    :class="flashClass"
    role="alert"
  >
    {{ title }}{{ description }}
  </div>
</template>

<script lang="ts">
import { defineComponent, computed } from '@nuxtjs/composition-api'

export default defineComponent({
  name: 'FlashMessage',
  props: {
    title: {
      type: String,
      required: true
    },
    isShow: {
      type: Boolean,
      required: true
    },
    isSuccess: {
      type: Boolean,
      required: false,
      default: null
    }
  },
  emits: ['flash-message'],
  setup (props) {
    const flashClass = computed(() => {
      return props.isSuccess ? 'alert alert-primary' : 'alert alert-danger'
    })

    const description = computed(() => {
      return props.isSuccess ? 'に成功しました' : 'に失敗しました'
    })

    return {
      flashClass,
      description
    }
  }
})
</script>

<style scoped>
</style>
