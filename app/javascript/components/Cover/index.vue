<template>
  <div class="o-cover">
    <div class="o-cover__inner">
      <div class="o-cover__contents">
        <h1 class="o-cover__head">
          プロテイン選びで
          <br>
          失敗したくないあなたへ
        </h1>
        <a
          v-if="!isLoggedIn"
          class="o-cover__link btn btn-success"
          href="/signup"
        >
          SuppleBoxを始める
        </a>
      </div>
    </div>
  </div>
</template>

<script lang="ts">

export default {
  props: {
    isLoggedIn: {
      type: Boolean,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.o-cover {
  margin-top: -20px;
  margin-bottom: 20px;
  width: 100%;
  height: auto;
  background: url("https://supplebox.jp/images/cover-bg.jpg") center center no-repeat;
  background-size: cover;
  &__inner {
    height: 100%;
    margin: auto;
    display: table;
    &__contents {
      display: table-cell;
      vertical-align: middle;
      text-align: center;
      position: relative;
    }
  }
  &__link {
    text-align: center;
    display: block;
    margin-bottom: 20px;
  }
  h1 {
    text-align: center;
    margin: 0 0 20px 0;
    padding: 3em 0;
    color: white;
    font-weight: bold;
    letter-spacing: 0.15em;
    font-size: 4em;
    text-shadow:
      black 1px 1px 0px, black -1px 1px 0px,
      black 1px -1px 0px, black -1px -1px 0px;
  }
}
</style>
