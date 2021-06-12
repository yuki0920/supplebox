import ProductItem from './index.vue'

export default {
  title: 'Components/ProductItem',
  component: ProductItem,
};

const Template = (args) => ({
  components: { ProductItem },
  template:
    `<ProductItem v-bind="args" />`,
  setup() {
    return { args }
  }
});

export const Default = Template.bind({})
Default.args = {
  product: {
    title: "明治 ザバス ウェイトダウン ヨーグルト風味",
    image_url: "https://images-fe.ssl-images-amazon.com/images/I/51MRScMCrKL.jpg",
    path: "/products/2",
    brand_amazon_name: "SAVAS(ザバス)",
    post_count: "6",
    rate: "3.4"
  }
}
