import axios from '@axios'
import { ref, reactive, onMounted } from 'vue'
import { DefaultApi, CurrentUserUser as CurrentUser } from '@/types/typescript-axios/api'
const formDataConfig = { headers: { 'content-type': 'multipart/form-data' } }

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

export const useUser = ({ id }: { id: number }) => {
  const user = reactive({name: null, gender: null, height: null, weight: null, comment: null, pictureUrl: null})
  onMounted(async() => {
    const { data } = await new DefaultApi().fetchUser(id)
    user.name = data.user.name
    user.gender =  data.user.gender
    user.height = data.user.height
    user.weight = data.user.weight
    user.comment = data.user.comment
    user.pictureUrl = data.user.picture_url
  })

  return { user }
}

export const usePost = ({ productId }) => {
  type postParams = { title: string, rate: string, content: string, picture: File, pictureUrl: string}
  const post = reactive<postParams>({ title: null, rate: null, content: null, picture: null, pictureUrl: null })

  const onChange = ({type, payload}) => {
    switch(type) {
    case 'title':
      post.title = payload
      break
    case 'rate':
      post.rate = payload
      break
    case 'content':
      post.content = payload
      break
    case 'picture':
      post.picture = payload
      break
    default:
      break
    }
  }

  const formData = () => {
    const data = new FormData()
    data.append('post[title]', post.title)
    data.append('post[rate]', post.rate)
    data.append('post[content]', post.content)
    data.append('post[picture]', post.picture)
    data.append('post[product_id]', productId)

    return data
  }

  const createPost = async() => {
    return await axios.post('/api/posts', formData(), formDataConfig)
  }

  const deletePost = async ({ id }: { id: number }) => {
    if (window.confirm('口コミを削除してもよろしいですか?')) {
      await new DefaultApi().deletePost(id)

      history.back()
    }
  }

  return { post, onChange, createPost, deletePost }
}

export const useProduct = () => {
  const product = ref(null)
  const fetchProduct = async ({ id }: { id: number }) => {
    const {data} = await new DefaultApi().fetchProduct(id)

    product.value = data.product
  }

  return { fetchProduct, product }
}
