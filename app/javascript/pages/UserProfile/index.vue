<template>
  <div class="o-user-profile">
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
                <a
                  :href="`/users/${user.id}/edit`"
                >プロフィールを編集する</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { ref } from 'vue'
import { DefaultApi } from '@/types/typescript-axios/api'

export default {
  name: 'UserProfile',
  setup() {
    const user = ref(null)
    const userId = parseInt(location.pathname.split('/')[2])
    const fetchUser = async() => {
      const {data} = await new DefaultApi().fetchUser(userId)
      user.value = data.user
    }

    const isCurrentUser =  ref(false)
    const fetchCurrentUser = async() => {
      const { data } = await new DefaultApi().fetchCurrentUser()
      isCurrentUser.value = data.user && data.user.id === userId
    }

    fetchUser()
    fetchCurrentUser()

    return {
      user,
      isCurrentUser
    }
  }
}
</script>

<style lang="scss" scoped>
.o-user-profile {
  &__button {
    display: block;
  }
}
</style>
