<template>
  <div v-if="isDisplay" :class="flashClass()" role="alert">
    {{ messageText }}
  </div>
</template>

<script>

export default {
  name: 'FlashMessage',
  props: {
    isDisplay: {
      type: Boolean,
      required: true
    },
    messageText: {
      type: String,
      required: true
    },
    messageType: {
      type: String,
      required: true
    },
  },
  methods: {
    flashClass() {
      return `alert alert-${this.messageType}`
    }
  }
}
</script>

<style scoped>
</style>
