<template>
  <div class="o-like-button">
    <span
      v-if="nowLiked"
      class="o-like-button__unlike btn btn-success"
      @click="unlike"
    >お気に入り登録中</span>
    <span
      v-else
      class="o-like-button__like btn btn-outline-success"
      @click="like"
    >お気に入り登録する</span>
  </div>
</template>

<script lang="ts">
import { ref } from 'vue'
import { DefaultApi } from '@/types/typescript-axios/api'
export default {
  name: 'LikeButton',
  components: {
  },
  props: {
    productId: {
      type: Number,
      required: true
    },
    isLiked: {
      type: Boolean,
      required: true,
    },
  },
  setup(props) {
    const nowLiked = ref(props.isLiked)

    const like = async() => {
      await new DefaultApi().likeProduct(props.productId)
      nowLiked.value = !nowLiked.value
    }
    const unlike = async() => {
      await new DefaultApi().unlikeProduct(props.productId)
      nowLiked.value = !nowLiked.value
    }

    return {
      nowLiked,
      like,
      unlike,
    }
  }
}
</script>

<style lang="scss" scoped>
.o-like-button {
  &__like, &__unlike {
    display: block;
  }
}
</style>
