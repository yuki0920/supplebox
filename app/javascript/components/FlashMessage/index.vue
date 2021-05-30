<template>
  <div
    v-if="isDisplay"
    :class="flashClass()"
    role="alert"
  >
    {{ messageText }}
  </div>
</template>

<script lang="ts">

export default {
  name: 'FlashMessage',
  props: {
    isDisplay: {
      type: Boolean,
      required: true
    },
    messageText: {
      type: String,
      required: false,
      default: null
    },
    messageType: {
      type: String,
      required: false,
      default: null
    },
  },

  setup(props) {
    const flashClass = () => {
      return `alert alert-${props.messageType}`
    }

    return {
      flashClass,
    }
  }
}
</script>

<style scoped>
</style>
