<template>
  <div class="product-list">
    <div class="product-list__header">
      <h2>
        アイテム一覧
      </h2>
    </div>
    <div class="row justify-content-center">
      <div class="product-list__form form-inline">
        <div class="form-group">
          <input
            id="q_title_or_brand_amazon_name_cont"
            class="form-control input-lg"
            placeholder="ブランドやアイテム名を入力"
            size="40"
            type="text"
            name="q[title_or_brand_amazon_name_cont]"
          >
        </div>
        <input
          type="submit"
          name="commit"
          value="アイテムを検索"
          class="btn btn-success"
          data-disable-with="アイテムを検索"
        >
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'ProductList',
  props: {
    product: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.product-list{
  &__header {
    text-align: center;
  }
}
</style>
