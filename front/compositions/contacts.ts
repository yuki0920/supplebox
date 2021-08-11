import { reactive, useContext } from '@nuxtjs/composition-api'
import { CreateContactParamsResource } from '@/types/typescript-axios'

// TODO: productとproductsのロジックを分割する
export const useContacts = () => {
  const { $axios } = useContext()

  const paramsResource = reactive<CreateContactParamsResource>(
    {
      name: '',
      email: '',
      title: '',
      content: ''
    }
  )

  const params = { contacts: paramsResource }

  const createContact = () => {
    return $axios.post('/api/contacts', params)
  }

  return {
    paramsResource, createContact
  }
}
