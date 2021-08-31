import { ref, reactive, useContext, useRouter } from '@nuxtjs/composition-api'
import { GetPostResponse, GetPostsResponseResourceEach } from '@/types/typescript-axios'
import { useId } from '@/compositions'
const formDataConfig = { headers: { 'content-type': 'multipart/form-data' } }

export const usePost = () => {
  const { $axios } = useContext()
  const router = useRouter()
  type postParams = { title: string, rate: number, content: string, picture: File | string, pictureUrl: string, productId: number}
  const post = reactive<postParams>({ title: '', rate: 0, content: '', picture: '', pictureUrl: '', productId: 0 })

  type postInput = 'title' | 'rate' | 'content' | 'picture'
  const onChange = ({ type, payload }: { type: postInput, payload: any }) => {
    switch (type) {
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
    data.append('post[rate]', String(post.rate))
    data.append('post[content]', post.content)
    data.append('post[picture]', post.picture)
    data.append('post[product_id]', String(post.productId))

    return data
  }

  const createPost = async() => {
    return await $axios.post('/api/posts', formData(), formDataConfig)
  }

  const getPost = async ({ id }: { id?: number }) => {
    const postId = id ?? useId()
    const { data }: { data: GetPostResponse } = await $axios.get(`/api/posts/${postId}`)

    post.title = data.post.title
    post.rate = data.post.rate
    post.content = data.post.content
    post.productId = data.post.product_id
  }

  const updatePost = async ({ id }: { id?: number }) => {
    return await $axios.put(`/api/posts/${id}`, formData(), formDataConfig)
  }

  const deletePost = async ({ id }: { id?: number }) => {
    const postId = id ?? useId()

    if (window.confirm('口コミを削除してもよろしいですか?')) {
      await $axios.delete(`/api/posts/${postId}`)

      router.go(-1)
    }
  }

  return { post, onChange, getPost, createPost, updatePost, deletePost }
}

export const usePosts = () => {
  const { $axios } = useContext()
  const posts = ref<GetPostsResponseResourceEach[]>([])
  const totalPages = ref(1)

  /* eslint-disable camelcase */
  type GetPostsParams = {
    per?: number,
    page?: number,
    user_id?: number,
    product_id?: number
  }

  const getPosts = async ({ per, page, user_id, product_id }: GetPostsParams) => {
    const params: GetPostsParams = {}
    if (per) { params.per = per }
    if (page) { params.page = page }
    if (user_id) { params.user_id = user_id }
    if (product_id) { params.product_id = product_id }

    const { data } = await $axios.get('/api/posts', { params })
    posts.value = data.posts
    totalPages.value = data.total_pages
  }

  return { posts, totalPages, getPosts }
}
