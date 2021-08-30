import { ref, useContext } from '@nuxtjs/composition-api'
import { GetProductResponse, GetProductResponseResource, GetProductsResponse, GetProductsResponseResourceEach, SearchProductsResponse, SearchProductsResponseResourceEach } from '@/types/typescript-axios'
import { useId } from '@/compositions'

export const useProduct = () => {
  const { $axios } = useContext()

  const product = ref<GetProductResponseResource | null>(null)
  const fetchProduct = async ({ id }: { id?: number }) => {
    const productId = id ?? useId()
    const { data }: { data: GetProductResponse } = await $axios.get(`/api/products/${productId}`)

    product.value = data.product
  }

  return { product, fetchProduct }
}

export const useProducts = () => {
  const { $axios } = useContext()
  const products = ref<GetProductsResponseResourceEach[]>([])
  const totalPages = ref(1)

  /* eslint-disable camelcase */
  type GetProductsParams = {
    per?: number,
    page?: number,
    user_id?: number,
    keyword?: string
  }

  const getProducts = async ({ per, page, user_id, keyword }: GetProductsParams) => {
    const params: GetProductsParams = {}
    if (per) { params.per = per }
    if (page) { params.page = page }
    if (user_id) { params.user_id = user_id }
    if (keyword) { params.keyword = keyword }

    const { data }: { data: GetProductsResponse } = await $axios.get('/api/products', { params })

    products.value = data.products
    totalPages.value = data.total_pages
  }

  return { products, totalPages, getProducts }
}

export const useNewProducts = () => {
  const { $axios } = useContext()
  const products = ref<SearchProductsResponseResourceEach[]>([])
  const keyword = ref('')

  const searchNewProducts = async () => {
    const params = { keyword: keyword.value }
    const { data }: { data: SearchProductsResponse } = await $axios.get('/api/products/new', { params })

    products.value = data.products
  }

  return { products, keyword, searchNewProducts }
}

export const useLikeProduct = () => {
  const { $axios } = useContext()

  const likeProduct = (productId: number) => {
    return $axios.post(`/api/products/${productId}/like`)
  }

  const unlikeProduct = (productId: number) => {
    return $axios.delete(`/api/products/${productId}/like`)
  }

  return { likeProduct, unlikeProduct }
}
