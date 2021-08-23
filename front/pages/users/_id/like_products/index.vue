<template>
  <div v-if="user">
    <UserProfile :user="user" />
    <div class="p-user-products col-md-12">
      <UserNav />
      <ProductItems
        v-if="products.length > 1"
        :is-logged-in="true"
        :products="products"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, PropType, ref } from '@nuxtjs/composition-api'
import { useCurrentUser, useUser, useProducts, useId } from '@/compositions'
import { GetCurrentUserResponseResource } from '@/types/typescript-axios'
export default defineComponent({
  name: 'User',
  props: {
    currentUser: {
      type: Object as PropType<GetCurrentUserResponseResource>,
      required: false,
      default: null
    }
  },
  setup () {
    const { currentUser } = useCurrentUser()
    const userId = useId()
    const { products, getProducts } = useProducts()
    const isCurrentUser = ref(false)

    onMounted(async () => {
      await getProducts({ user_id: userId })
      isCurrentUser.value = currentUser !== undefined && (userId === currentUser.value?.id)
    })

    const { user } = useUser()

    return {
      user,
      isCurrentUser,
      products
    }
  }
})
</script>

<style lang="scss" scoped>
.p-product-index {
  &__form {
    justify-content: center;
    margin-bottom: 1em;
  }
}
</style>
