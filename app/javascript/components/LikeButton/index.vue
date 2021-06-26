<template>
  <a
    v-if="nowLiked"
    class="o-like-buttonm btn btn-success"
    href="javascript:void(0)"
    @click="unlike"
  >お気に入り登録中</a>
  <a
    v-else
    class="o-like-buttonm btn btn-outline-success"
    href="javascript:void(0)"
    @click="like"
  >お気に入り登録する</a>
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
    isLarge: {
      type: Boolean,
      required: false,
      default: false
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
.o-product-item {
  &__button {
    font-size: 0.8em;
    display: block;
  }
}
</style>
