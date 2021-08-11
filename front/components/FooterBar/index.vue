<template>
  <footer class="o-footer mt-3 py-4">
    <div class="o-footer__content">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list p-0 m-0">
              <li class="o-footer__list-item">
                <nuxt-link to="/">
                  トップページ
                </nuxt-link>
              </li>
              <li class="o-footer__list-item">
                <nuxt-link to="/terms_of_use">
                  利用基準
                </nuxt-link>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list p-0 m-0">
              <li class="o-footer__list-item">
                <nuxt-link to="/privacy_policy">
                  プライバシーポリシー
                </nuxt-link>
              </li>
              <li class="o-footer__list-item">
                <nuxt-link to="/contacts">
                  お問い合わせ
                </nuxt-link>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list p-0 m-0">
              <li class="o-footer__list-item">
                <nuxt-link to="/products">
                  プロテイン一覧を見る
                </nuxt-link>
              </li>
              <li class="o-footer__list-item">
                <nuxt-link to="/posts">
                  口コミ一覧を見る
                </nuxt-link>
              </li>
              <li class="o-footer__list-item">
                <nuxt-link to="/products/new">
                  プロテインを登録する
                </nuxt-link>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-12 col-md-pull-9">
            <div class="o-footer__logo">
              <nuxt-link to="/">
                <h5>
                  SuppleBox
                </h5>
              </nuxt-link>
            </div>
            <p>
              <small>© 2019-2021. All Rights Reserved.</small>
            </p>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script lang="ts">
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  name: 'FooterBar'
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
