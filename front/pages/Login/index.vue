<template>
  <div class="p-login mt-3">
    <FlashMessage
      title="ログイン"
      :is-show="messageIsShow"
      :is-success="messageIsSuccess"
      @flash-message="onFlashMessage"
    />
    <div class="p-login row justify-content-center">
      <div class="col-xs-offset-2 col-xs-8 col-md-offset-3 col-md-6">
        <div class="card">
          <div class="card-header">
            ログイン
          </div>
          <div class="card-body">
            <form @submit.prevent="submitForm">
              <div class="form-group">
                <label for="session_email">メールアドレス</label>
                <input
                  id="session_email"
                  v-model="email"
                  class="form-control"
                  type="email"
                  name="session[email]"
                >
              </div>
              <div class="form-group">
                <label for="session_password">パスワード</label>
                <input
                  id="session_password"
                  v-model="password"
                  class="form-control"
                  type="password"
                  name="session[password]"
                >
              </div>
              <div>
                <input
                  type="submit"
                  value="ログイン"
                  class="btn btn-success btn-block"
                >
              </div>
            </form>
            <p>
              アカウントをお持ちでない方はこちらから
              <nuxt-link to="/signup">
                新規登録
              </nuxt-link>してください
              <br>
              試しに使ってみたい方は
              <a
                href="javascript:void(0)"
                @click="loginAsTestUser"
              >
                テストアカウント
              </a>
              をお使いください
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'
import FlashMessage from '@/components/FlashMessage/index.vue'
import { useFlashMessage, useSession } from '@/compositions'
import { GetCurrentUserResponse } from '@/types/typescript-axios'

export default defineComponent({
  name: 'Login',
  components: { FlashMessage },
  setup () {
    const { messageIsShow, messageIsSuccess, onFlashMessage } = useFlashMessage()

    const { email, password, loginAsTestUser, createSession } = useSession()
    const submitForm = async () => {
      try {
        const { data }: { data: GetCurrentUserResponse } = await createSession()
        if (!data.user) { throw new Error('User is not found') }

        onFlashMessage({ isSuccess: true })
        location.href = '/'
      } catch (error) {
        onFlashMessage({ isSuccess: false })
      }
    }

    return {
      messageIsShow,
      messageIsSuccess,
      onFlashMessage,
      email,
      password,
      submitForm,
      loginAsTestUser
    }
  }
})
</script>

<style lang='scss' scoped>
</style>
