import { ref, onMounted } from 'vue'
import { DefaultApi, CurrentUserUser as CurrentUser } from '@/types/typescript-axios/api'

export const useCurrentUser = () => {
  const currentUser = ref<CurrentUser>(null)
  const isLoggedIn = ref(false)
  onMounted(async () => {
      const { data } = await new DefaultApi().fetchCurrentUser()
      currentUser.value = data.user
      isLoggedIn.value = !!currentUser.value
    }
  )

  return { currentUser, isLoggedIn }
}

export const useSessions = () => {
  const loginAsTestUser = async () => {
    const { data } = await new DefaultApi().loginAsTestUser()
    location.href = `/users/${data.user.id}`
  }
  return { loginAsTestUser }
}
