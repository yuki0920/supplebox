import { ref, reactive, Ref, onMounted, useContext, provide, inject } from '@nuxtjs/composition-api'
import { GetCurrentUserResponse, GetCurrentUserResponseResource } from '@/types/typescript-axios'
import { useId } from '@/compositions'
const formDataConfig = { headers: { 'content-type': 'multipart/form-data' } }

/* eslint-disable camelcase */
type userParams = { id: number, name: string, gender: string, height: string, weight: string, comment: string, picture: File | string, picture_url: string }
export const useUser = () => {
  const { $axios } = useContext()
  const user = reactive<userParams>({ id: 0, name: '', gender: '', height: '', weight: '', comment: '', picture: '', picture_url: '' })

  const getUser = () => {
    const userId = useId()

    return $axios.get(`/api/users/${userId}`)
  }

  onMounted(async () => {
    const { data }: { data: any } = await getUser()

    user.id = data.user.id
    user.name = data.user.name
    user.gender = data.user.gender
    user.height = data.user.height
    user.weight = data.user.weight
    user.comment = data.user.comment
    user.picture_url = data.user.picture_url
  })

  const onChangePicture = (e: any) => {
    e.preventDefault()
    user.picture = e.target.files[0]
  }

  const formData = () => {
    const data = new FormData()
    data.append('user[name]', user.name)
    data.append('user[gender]', user.gender)
    data.append('user[height]', user.height)
    data.append('user[weight]', user.weight)
    data.append('user[comment]', user.comment)
    if (user.picture !== null) { data.append('user[picture]', user.picture) }

    return data
  }

  const updateUser = ({ id }: { id: number }) => {
    return $axios.put(`/api/users/${id}`, formData(), formDataConfig)
  }

  return { user, onChangePicture, updateUser }
}

type currentUser = GetCurrentUserResponseResource | null
export const useCurrentUser = () => {
  const currentUserRef = ref<currentUser>(null)
  const isLoggedInRef = ref(false)
  const { $axios } = useContext()
  const getCurrentUser = () => {
    return $axios.get('/api/sessions')
  }
  onMounted(async () => {
    if (!isLoggedInRef.value) {
      const { data }: { data: GetCurrentUserResponse } = await getCurrentUser()
      currentUserRef.value = data.user
      isLoggedInRef.value = !!currentUserRef.value
    }
  })

  provide('currentUser', currentUserRef)
  provide('isLoggedIn', isLoggedInRef)

  const currentUser = inject<Ref<currentUser>>('currentUser')
  const isLoggedIn = inject<Ref<Boolean>>('isLoggedIn')

  return { currentUser, isLoggedIn, getCurrentUser }
}
