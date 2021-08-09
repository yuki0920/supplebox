<template>
  <footer class="o-footer mt-3 py-4">
    <div class="o-footer__content">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list p-0 m-0">
              <li class="o-footer__list-item">
                <a href="/">トップページ</a>
              </li>
              <li class="o-footer__list-item">
                <a href="/policy">利用基準</a>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list p-0 m-0">
              <li class="o-footer__list-item">
                <a href="/privacypolicy">プライバシーポリシー</a>
              </li>
              <li class="o-footer__list-item">
                <a href="/contacts">お問い合わせ</a>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list p-0 m-0">
              <li class="o-footer__list-item">
                <a href="/products">プロテイン一覧を見る</a>
              </li>
              <li class="o-footer__list-item">
                <a href="/posts">口コミ一覧を見る</a>
              </li>
              <li class="o-footer__list-item">
                <a href="/products/new">プロテインを登録する</a>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-12 col-md-pull-9">
            <div class="o-footer__logo">
              <a href="/">
                <h5>
                  SuppleBox
                </h5>
              </a>
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

export default {
  name: 'Footer',
}
</script>

<style lang="scss" scoped>
.o-footer {
  background: #323a45;
  color: #878c93;

  a {
    text-decoration: none;
    color: #9a9fa5;
    &:hover, &:active, &:focus {
      color: #4fd2c2;
    }
  }
  ul {
    list-style-type: none;
  }
  &__list {
    &__item {
      list-style: none;
      padding: 0;
      margin: 0 0 14px 0;
      line-height: 16px;
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
