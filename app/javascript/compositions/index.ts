import { ref, onMounted } from 'vue'
import { DefaultApi, CurrentUserUser as CurrentUser } from '@/types/typescript-axios/api'

export const useCurrentUser = () => {
  const currentUser = ref(null)
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
  const logout = async () => {
    await new DefaultApi().logout()
    location.href = '/'
  }
  return { loginAsTestUser, logout }
}

export const useFlashMessage = () => {
  const messageIsShow = ref(false)
  const messageIsSuccess = ref(false)
  const onFlashMessage = async({isSuccess = false}: {isSuccess: boolean}) => {
    messageIsShow.value = true
    messageIsSuccess.value = isSuccess

    await new Promise(resolve => setTimeout(resolve, 3000))
    messageIsShow.value = false
  }

  return { messageIsShow, messageIsSuccess, onFlashMessage }
}
