<template>
  <div class="o-post-item row posts">
    <div class="o-post-item__user col-md-2">
      <nuxt-link :to="`/users/${post.user.id}`">
        <img
          :src="post.user.picture_url"
          class="o-post-item__user-image"
        >
        <p class="posts-title">
          {{ post.user.name }}
        </p>
      </nuxt-link>
      <p class="o-post-item__user-profile">
        {{ post.user.gender }}
        {{ post.user.height }}
        {{ post.user.weight }}
      </p>
    </div>
    <div class="o-post-item__post col-md-6">
      <p>
        {{ post.created_at }}
      </p>
      <h4 class="mb-3">
        評価: {{ post.rate }} 点 | {{ post.title }}
      </h4>
      <p>
        {{ post.content }}
      </p>
      <img
        v-if="post.picture_url != null"
        :src="post.picture_url"
        class="o-post-item__user-image img-fluid"
      >
    </div>
    <div class="o-post-item__product col-md-4">
      <a :href="`/products/${post.product.id}`">
        <img
          :src="post.product.image_url"
          class="o-post-item__product-image"
        >
        <p>
          {{ post.product.title }}
        </p>
      </a>
    </div>
    <div
      v-if="post.is_owner"
      class="o-post-item__edit-button col-md-12 edit-button"
    >
      <nuxt-link
        class="btn btn-success"
        :to="`/posts/${post.id}/edit`"
      >
        口コミを編集
      </nuxt-link>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, PropType } from '@nuxtjs/composition-api'
import { GetPostsResponseResourceEach } from '@/types/typescript-axios'

export default defineComponent({
  name: 'PostItem',
  props: {
    post: {
      type: Object as PropType<GetPostsResponseResourceEach>,
      required: true
    }
  },
  setup () {
  }
})
</script>

<style lang="scss" scoped>
.o-post-item {
  background-color: white;
  margin: 10px 0;
  padding: 10px 0;
  &__user-image {
    width: 100px;
  }
  &__user-profile {
    font-size: 12px;
  }
  &__post {
    position: relative;
    display: inline-block;
    padding: 7px 10px;
    min-width: 120px;
    width: 100%;
    font-size: 16px;
    background: #e3f9e3;
    border-radius: 15px;
    &:before {
      content: "";
      position: absolute;
      top: 35px;
      left: -30px;
      margin-top: -15px;
      border: 15px solid transparent;
      border-right: 15px solid #e3f9e3;
    }
    p {
      margin: 0;
      padding: 0;
    }
    img {
      max-width: 40%;
      margin-bottom: 10px;
    }
  }
  &__product {
    border: solid;
    border-color: #f4f4f4;
    border-radius: 15px;
    display: inline-block;
    padding: 10px;
    img {
      max-width: 25%;
      height: auto;
      float: left;
      margin-right: 10px;
    }
  }
}
</style>
