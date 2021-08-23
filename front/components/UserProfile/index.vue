<template>
  <div v-if="user" class="o-user-profile">
    <h2>{{ user.name }}さんのプロフィール</h2>
    <div class="row">
      <div class="col-md-4">
        <div class="product_detail card mb-3">
          <img
            :src="user.picture_url"
          >
        </div>
      </div>
      <div class="col-md-8">
        <table class="table">
          <tbody>
            <tr>
              <th>性別</th>
              <td>
                {{ user.gender || '-' }}
              </td>
            </tr>
            <tr>
              <th>身長</th>
              <td>
                {{ user.height || '-' }}
              </td>
            </tr>
            <tr>
              <th>体重</th>
              <td>
                {{ user.weight || '-' }}
              </td>
            </tr>
            <tr>
              <th>自己紹介</th>
              <td>
                {{ user.comment || '-' }}
              </td>
            </tr>
            <tr v-if="isCurrentUser">
              <th>編集</th>
              <td>
                <nuxt-link :to="`/users/${user.id}/edit`">
                  プロフィールを編集する
                </nuxt-link>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, PropType } from '@nuxtjs/composition-api'
import { GetUserResponseResource } from '@/types/typescript-axios'

export default defineComponent({
  name: 'UserProfile',
  props: {
    isCurrentUser: {
      type: Boolean,
      required: true
    },
    user: {
      type: Object as PropType<GetUserResponseResource>,
      required: true
    }
  },
  setup () {
  }
})
</script>

<style lang="scss" scoped>
.o-user-profile {
}
</style>
