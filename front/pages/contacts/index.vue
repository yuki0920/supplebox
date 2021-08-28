<template>
  <div class="contact">
    <FlashMessage
      title="お問い合わせ"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <h1 class="text-center">
      お問い合わせ
    </h1>
    <p>お気軽にお問い合わせください!</p>
    <form @submit.prevent="submitForm">
      <div class="form-group row">
        <label
          for="contact_name"
          class="col-sm-3 col-form-label"
        >お名前</label>
        <input
          id="contact_name"
          v-model="paramsResource.name"
          type="text"
          class="col-sm-9 form-control"
        >
      </div>
      <div class="form-group row">
        <label
          for="contact_email"
          class="col-sm-3 col-form-label"
        >メールアドレス</label>
        <input
          id="contact_email"
          v-model="paramsResource.email"
          type="email"
          class="col-sm-9 form-control"
        >
      </div>
      <div class="form-group row">
        <label
          for="contact_title"
          class="col-sm-3 col-form-label"
        >タイトル</label>
        <input
          id="contact_title"
          v-model="paramsResource.title"
          type="text"
          class="col-sm-9 form-control"
        >
      </div>
      <div class="form-group row">
        <label
          for="contact_content"
          class="col-sm-3 col-form-label"
        >お問い合わせ内容</label>
        <textarea
          id="contact_content"
          v-model="paramsResource.content"
          class="col-sm-9 form-control"
          rows="3"
        />
      </div>

      <div class="form-group row justify-content-end">
        <div class="col-sm-9">
          <button
            type="submit"
            class="btn btn-success"
          >
            送信する
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'
import { useContacts, useFlashMessage } from '@/compositions'
import FlashMessage from '@/components/FlashMessage/index.vue'

export default defineComponent({
  name: 'ContactForm',
  components: { FlashMessage },
  setup () {
    const { paramsResource, createContact } = useContacts()

    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()
    const submitForm = async () => {
      try {
        await createContact()
        await onFlashMessage({ isSuccess: true })
      } catch (error) {
        await onFlashMessage({ isSuccess: false })
      }
    }

    return {
      paramsResource,
      submitForm,
      messageIsShow,
      messageIsSuccess,
      onFlashMessage
    }
  }
})
</script>

<style scoped>
p {
  font-size: 1em;
  text-align: center;
}
</style>
