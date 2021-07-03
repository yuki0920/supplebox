<template>
  <div class="o-post-form">
    <h2
      class="o-post-form__heading mb-3"
    >
      {{ head }}
    </h2>
    <form @submit.prevent="submit">
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="title"
        >タイトル</label>
        <div class="col-md-9">
          <input
            id="title"
            :value="title"
            class="form-control"
            type="text"
            name="title"
            @input="onChangeTitle"
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
              :checked="number == rate"
              type="radio"
              name="rate"
              class="o-post-form__radio form-check-input"
              :value="number"
              @change="onChangeRate"
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
            @change="onChangePicture"
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
            :value="content"
            class="form-control"
            rows="3"
            placeholder="口コミ内容がなくても、タイトルと評価のみで投稿できます。まずは投稿してみましょう！投稿してから編集もできますよ！"
            name="content"
            @input="onChangeContent"
          />
        </div>
      </div>
      <div class="form-group row justify-content-end">
        <div class="col-md-9">
          <input
            type="submit"
            name="commit"
            value="送信"
            class="btn btn-success"
          >
        </div>
      </div>
    </form>
    <div
      v-if="isEdit"
      class="col-md-9"
    >
      <a
        href="javascript:void(0)"
        class="btn btn-light"
        @click="deletePost"
      >口コミを削除する</a>
    </div>
  </div>
</template>

<script lang="ts">
import { DefaultApi } from '@/types/typescript-axios/api'

export default {
  name: 'PostForm',
  props: {
    isEdit: {
      type: Boolean,
      required: false,
      default: false
    },
    head: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: false,
      default: null,
    },
    rate: {
      type: Number,
      required: false,
      default: null,
    },
    content: {
      type: String,
      required: false,
      default: null,
    },
  },
  emits: ['change', 'submit', 'deletePost'],
  setup(_props, context) {
    const onChangeTitle = (e) => {
      context.emit('change', {type: 'title',payload: e.target.value})
    }
    const onChangeRate = (e) => {
      context.emit('change', {type: 'rate',payload: e.target.value})
    }
    const onChangeContent = (e) => {
      context.emit('change', {type: 'content',payload: e.target.value})
    }
    let picture
    const onChangePicture = (e) => {
      e.preventDefault()
      picture = e.target.files[0]

      context.emit('change', {type: 'picture',payload: picture})
    }

    const submit = () => {
      context.emit('submit')
    }

    // TODO: イベントの流れ的には、親コンポーネントで実行したい
    const deletePost = () => {
      context.emit('deletePost')
    }

    return {
      deletePost,
      submit,
      onChangeTitle,
      onChangeRate,
      onChangeContent,
      onChangePicture,
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
