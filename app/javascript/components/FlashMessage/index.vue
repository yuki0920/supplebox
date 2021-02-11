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
