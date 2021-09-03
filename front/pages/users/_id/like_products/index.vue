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
      <div class="overflow-auto">
        <b-pagination-nav :link-gen="linkGen" :number-of-pages="totalPages" use-router />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, onMounted, PropType, ref, useRouter } from '@nuxtjs/composition-api'
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
    const { products, totalPages, getProducts } = useProducts()
    const isCurrentUser = ref(false)
    const load = async (page = 1) => {
      await getProducts({ per: 12, page, user_id: userId })
    }

    onMounted(async () => {
      await load()
      isCurrentUser.value = currentUser !== undefined && (userId === currentUser.value?.id)
    })

    const linkGen = (pageNum: number) => {
      return pageNum === 1 ? '?' : `?page=${pageNum}`
    }

    const router = useRouter()
    router.beforeEach((to, from, next) => {
      if (to.name === 'like_products' && from.name === 'like_products' && (typeof to.query.page === 'string' || to.query.page === undefined)) {
        load(parseInt(to.query.page, 10) || 1)
        scrollTo(0, 0)
      }
      next()
    })

    const { user } = useUser()

    return {
      user,
      isCurrentUser,
      products,
      totalPages,
      linkGen
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
