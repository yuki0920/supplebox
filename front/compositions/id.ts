import { useRoute } from '@nuxtjs/composition-api'

export const useId = () => {
  const route = useRoute()

  return route.value.params.id ? parseInt(route.value.params.id, 10) : 0
}
