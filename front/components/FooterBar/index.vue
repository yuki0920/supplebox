<template>
  <footer class="o-footer fixed-bottom mt-3 py-2">
    <div class="o-footer__content">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-4 col-md-push-3 mt-sm-2">
            <nuxt-link to="/terms_of_use">
              利用基準
            </nuxt-link>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3 mt-sm-2">
            <nuxt-link to="/privacy_policy">
              プライバシーポリシー
            </nuxt-link>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3 mt-sm-2">
            <nuxt-link to="/contacts">
              お問い合わせ
            </nuxt-link>
          </div>
          <div class="col-md-3 col-sm-12 col-md-pull-3">
            <div class="o-footer__logo">
              <nuxt-link to="/">
                <p class="m-0">
                  SuppleBox
                </p>
              </nuxt-link>
              <small>© 2019-2021. All Rights Reserved.</small>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  name: 'Footer'
})
</script>

<style lang="scss" scoped>
.o-footer {
  background: #323a45;
  color: #878c93;

  a {
    color: #9a9fa5;
    &:hover, &:active, &:focus {
      color: #4fd2c2;
    }
    text-decoration: none;
  }
  &__logo {
    a {
      &:hover, &:active, &:focus{
        color: white;
      }
    }
  }
}
</style>
