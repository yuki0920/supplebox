import { ref } from '@nuxtjs/composition-api'

export const useFlashMessage = () => {
  const messageIsShow = ref(false)
  const messageIsSuccess = ref(false)
  const onFlashMessage = async({ isSuccess = false }: {isSuccess: boolean}) => {
    messageIsShow.value = true
    messageIsSuccess.value = isSuccess

    await new Promise(resolve => setTimeout(resolve, 3000))
    messageIsShow.value = false
  }

  return { messageIsShow, messageIsSuccess, onFlashMessage }
}
