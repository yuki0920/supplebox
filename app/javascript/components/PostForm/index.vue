<template>
  <div class="o-post-form">
    <FlashMessage
      :is-display="message.isDisplay"
      :message-text="message.text"
      :message-type="message.type"
    />
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
            accept="image/jpeg,image/gif,image/png"
            class="btn"
            type="file"
            name="picture"
            @change="setPicture"
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
import FlashMessage from '../FlashMessage/index.vue'

import { reactive } from 'vue'
export default {
  name: 'ContactForm',
  components: { FlashMessage },
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

    const message = reactive({
      isDisplay: false,
      text: '',
      type: ''
    })

    const submitForm = async () => {
      const productId = location.pathname.split("/").slice(-1)[0]
      let formData = new FormData()
      formData.append('posts[title]', formInput.title)
      formData.append('posts[rate]', formInput.rate)
      formData.append('posts[content]', formInput.content)
      formData.append('posts[product_id]', productId)
      formData.append('posts[picture]', picture)
      const config = { headers : { 'content-type': 'multipart/form-data' } }

      try {
        await axios.post('/api/posts', formData, config)

        message.isDisplay = true
        message.text = "口コミを送信しました"
        message.type = "primary"

        formInput.title = ''
        formInput.rate = ''
        formInput.content = ''

        location.reload()
      } catch(error) {
        const { data } = error.response
        message.isDisplay = true
        message.text = `口コミの送信に失敗しました 「${data.message}」`
        message.type = "danger"
      }
    }
    return {
      message,
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
