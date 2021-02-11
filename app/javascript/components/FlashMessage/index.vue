<template>
  <div>
    <div v-if="message" :class="flashClass()" role="alert">
        {{ message.text }}
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'FlashMessage',
  props: {
    text: {
      type: String,
      required: true
    },
    type: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['message'])
  },
  methods: {
    flashClass() {
      return `alert alert-${this.message.type}`
    }
  }
}
</script>

<style scoped>
</style>
