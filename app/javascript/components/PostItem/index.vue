<template>
  <div class=" o-post-item row posts">
    <div class="o-post-item__user col-md-2">
      <a :href="post.user.path">
        <img
          :src="post.user.picture_url"
          class="o-post-item__user-image"
        >
        <p class="posts-title">
          {{ post.user.name }}
        </p>
      </a>
      <p class="o-post-item__user-profile">
        {{ post.user.gender }}
        {{ post.user.height }}
        {{ post.user.weight }}
      </p>
    </div>
    <div class="o-post-item__post col-md-6 mb-3">
      <p>
        {{ post.created_at }}
      </p>
      <h4 class="mb-3">
        評価: {{ post.rate }} 点 | {{ post.title }}
      </h4>
      <StarRating
        :increment="0.1"
        :rating="post.rate"
        :star-size="16"
        :show-rating="false"
        read-only
      />
      <p>
        {{ post.content }}
      </p>
      <img
        v-if="post.picture_url != null"
        :src="postpicture_url"
        class="o-post-item__user-image img-fluid"
      >
    </div>
    <div class="o-post-item__product col-md-4">
      <a :href="post.product.path">
        <img
          :src="post.product.image_url"
          class="o-post-item__product-image"
        >
        <p>
          {{ post.product.title }}
        </p>
      </a>
    </div>
  </div>
</template>

<script lang="ts">
import StarRating from 'vue-star-rating'

export default {
  name: 'PostItem',
  components: {
    StarRating
  },
  props: {
    post: {
      type: Object,
      required: true
    }
  },
}
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
    margin-bottom: 10px;
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
