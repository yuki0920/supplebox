import { ref, useContext, useRouter } from '@nuxtjs/composition-api'
import { GetCurrentUserResponse } from '@/types/typescript-axios'

export const useSession = () => {
  const { $axios } = useContext()
  const router = useRouter()
  const email = ref('')
  const password = ref('')

  const createSessionAsTestUser = () => {
    return $axios.post('/api/sessions/test_user')
  }
  const loginAsTestUser = async () => {
    const { data }: { data: GetCurrentUserResponse } = await createSessionAsTestUser()

    if (data.user !== null) {
      location.href = '/'
    }
  }

  const deleteSession = () => {
    return $axios.delete('/api/sessions')
  }
  const logout = async () => {
    await deleteSession()
    location.href = '/'
  }

  const createSession = () => {
    return $axios.post('/api/sessions',
      { session: { email: email.value, password: password.value } }
    )
  }

  return { createSession, loginAsTestUser, logout }
}
