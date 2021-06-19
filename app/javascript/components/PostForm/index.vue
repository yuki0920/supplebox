<template>
  <div class="o-post-form">
    <h2
      class="o-post-form__heading mb-3"
    >
      口コミ投稿する
    </h2>
    <form @submit.prevent="submitForm">
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="title"
        >タイトル </label>
        <div class="col-md-9">
          <input
            id="title"
            v-model="formInput.title"
            class="form-control"
            type="text"
            name="title"
          >
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="rate"
        >評価 </label>
        <div class="form-check form-check-inline">
          <span
            v-for="number in [1, 2, 3, 4, 5]"
            :key="number"
          >
            <input
              :id="`rate_${number}`"
              v-model="formInput.rate"
              type="radio"
              name="rate"
              class="o-post-form__radio form-check-input"
              :value="number"
            >
            <label
              class="form-check-label"
              :for="`rate_${number}`"
            >
              {{ number }}
            </label>
          </span>
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="picture"
        >口コミ画像 </label>
        <div class="col-md-9">
          <input
            id="picture"
            @change="setPicture"
            class="btn"
            type="file"
            name="picture"
          >
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="content"
        >口コミ内容 </label>
        <div class="col-md-9">
          <textarea
            id="content"
            v-model="formInput.content"
            class="form-control"
            rows="3"
            placeholder="口コミ内容がなくても、タイトルと評価のみで投稿できます。まずは投稿してみましょう！投稿してから編集もできますよ！"
            name="content"
          />
        </div>
      </div>
      <div class="form-group row justify-content-end">
        <div class="col-md-9">
          <input
            type="submit"
            name="commit"
            value="投稿する"
            class="btn btn-success"
          >
        </div>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
import axios from '@axios'

import { reactive } from 'vue'
export default {
  name: 'ContactForm',
  setup() {
    const formInput = reactive({
        title: '',
        rate: '5',
        content: ''
    })

    let picture
    const setPicture = (e) => {
      e.preventDefault()
      picture = e.target.files[0]
    }
    const submitForm = async () => {
      const productId = location.pathname.split("/").slice(-1)[0]
      let formData = new FormData()
      formData.append('posts[title]', formInput.title)
      formData.append('posts[rate]', formInput.rate)
      formData.append('posts[product_id]', productId)
      formData.append('posts[picture]', picture)
      const config = { headers : { 'content-type': 'multipart/form-data' } }

      try {
        await axios.post('/api/posts', formData, config)
      } catch(error) {
        const { data } = error.response
        console.log('data', data)
      }
    }
    return {
      formInput,
      setPicture,
      submitForm
    }
  }
}
</script>

<style lang='scss' scoped>
.o-post-form {
  &__radio {
    margin-left: 16px;
  }
}
</style>
