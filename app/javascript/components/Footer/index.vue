<template>
  <footer class="o-footer">
    <div class="o-footer__content">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list">
              <li class="o-footer__list-item">
                <a href="/">トップページ</a>
              </li>
              <li class="o-footer__list-item">
                <a href="/policy">利用基準</a>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list">
              <li class="o-footer__list-item">
                <a href="/privacypolicy">プライバシーポリシー</a>
              </li>
              <li class="o-footer__list-item">
                <a href="/contacts">お問い合わせ</a>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-4 col-md-push-3">
            <ul class="o-footer__list">
              <li class="o-footer__list-item">
                <a href="/products">アイテム一覧を見る</a>
              </li>
              <li class="o-footer__list-item">
                <a href="/products/new">アイテムを登録する</a>
              </li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-12 col-md-pull-9">
            <div class="o-footer__logo">
              <a href="/">SuppleBox</a>
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
  props: {
    isLoggedIn: {
      type: Boolean,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.o-footer {
  padding: 4em 0;
  background: #323a45;
  color: #878c93;
  bottom: 0;
  font-weight: 300;
  p {
    display: block;
  }
  a {
    color: #9a9fa5;
    &:hover, &:active, &:focus {
      color: #4fd2c2;
    }
  }
  ul {
    list-style-type: none;
  }
  &__list {
    padding: 0;
    margin: 0;
    &__item {
      list-style: none;
      padding: 0;
      margin: 0 0 14px 0;
      line-height: 16px;
    }
  }
  &__logo {
    display: block;
    float: left;
    width: 100%;
    margin-bottom: 10px;
    a {
      font-size: 20px;
      letter-spacing: 2px;
      color: #ccc;
      float: left;
      padding: 7px 10px 7px 12px;
      &:hover, &:active, &:focus{
        color: white;
        text-decoration: none;
      }
    }
  }
}
</style>
