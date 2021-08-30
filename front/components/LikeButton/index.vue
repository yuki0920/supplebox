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
import { defineComponent, ref } from '@nuxtjs/composition-api'
import { useLikeProduct } from '@/compositions'

export default defineComponent({
  name: 'LikeButton',
  props: {
    productId: {
      type: Number,
      required: true
    },
    isLiked: {
      type: Boolean,
      required: true
    }
  },
  setup (props) {
    const nowLiked = ref(props.isLiked)
    const { likeProduct, unlikeProduct } = useLikeProduct()

    const like = async () => {
      await likeProduct(props.productId)
      nowLiked.value = !nowLiked.value
    }
    const unlike = async () => {
      await unlikeProduct(props.productId)
      nowLiked.value = !nowLiked.value
    }

    return {
      nowLiked,
      like,
      unlike
    }
  }
})
</script>

<style lang="scss" scoped>
.o-like-button {
  &__like, &__unlike {
    display: block;
  }
}
</style>
