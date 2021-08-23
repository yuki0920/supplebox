<template>
  <div class="p-user-edit p-3">
    <h2 class="mb-3">
      プロフィールを編集する
    </h2>
    <FlashMessage
      title="プロフィールの編集"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <form @submit.prevent="submitForm">
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="user_picture"
        >プロフィール画像 </label>
        <div class="col-md-9">
          <input
            id="user_picture"
            accept="image/jpeg,image/gif,image/png"
            class="btn"
            type="file"
            name="user[picture]"
            @change="onChangePicture"
          >
          <img
            v-if="user.pictureUrl"
            class="p-user-edit__image img-fluid"
            :src="user.pictureUrl"
          >
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="user_name"
        >ユーザー名 </label>
        <div class="col-md-9">
          <input
            id="user_name"
            v-model="user.name"
            class="form-control"
            type="text"
            name="user[name]"
          >
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="user_gender"
        >性別</label>
        <div class="col-md-1">
          <select
            id="user_gender"
            v-model="user.gender"
            name="user[gender]"
          >
            <option
              v-for="gender in genders"
              :key="gender"
            >
              {{ gender }}
            </option>
          </select>
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="user_height"
        >身長 </label>
        <div class="col-md-1">
          <select
            id="user_height"
            v-model="user.height"
            name="user[height]"
          >
            <option
              v-for="height in heights"
              :key="height"
            >
              {{ height }}
            </option>
          </select>
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="user_weight"
        >体重</label>
        <div class="col-md-1">
          <select
            id="user_weight"
            v-model="user.weight"
            name="user[weight]"
          >
            <option
              v-for="weight in weights"
              :key="weight"
            >
              {{ weight }}
            </option>
          </select>
        </div>
      </div>
      <div class="form-group row">
        <label
          class="col-md-3 col-form-label"
          for="user_comment"
        >自己紹介 </label>
        <div class="col-md-9">
          <textarea
            id="user_comment"
            v-model="user.comment"
            class="form-control"
            rows="3"
            placeholder="自己紹介を記入してみましょう。例）週2回ジム通い/プロテイン1日3杯/筋トレは人生！"
            name="user[comment]"
          />
        </div>
      </div>
      <div class="form-group row justify-content-end">
        <div class="col-md-9">
          <input
            type="submit"
            value="更新する"
            class="btn btn-success"
            data-disable-with="更新する"
          >
        </div>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
import { defineComponent, useRouter } from '@nuxtjs/composition-api'
import { useUser, useFlashMessage, useId } from '@/compositions'
import { genders, heights, weights } from '@/lib/userProfileList'

export default defineComponent({
  name: 'EditUser',
  setup () {
    const router = useRouter()
    const userId = useId()
    const { user, updateUser } = useUser()

    // TODO: 画像投稿できるようにする
    // let picture: File
    const onChangePicture = (e: any) => {
      e.preventDefault()
      // picture = e.target.files[0]
    }

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      try {
        await updateUser({ id: userId })
        await onFlashMessage({ isSuccess: true })

        router.push(`/users/${userId}`)
      } catch {
        await onFlashMessage({ isSuccess: false })
      }
    }
    return {
      messageIsShow,
      messageIsSuccess,
      onFlashMessage,
      genders,
      heights,
      weights,
      user,
      onChangePicture,
      submitForm
    }
  }
})
</script>

<style lang='scss' scoped>
.p-user-edit {
  &__image {
    max-width: 160px;
    display: block;
  }
}
</style>
