import ProductSummary from './index.vue'

export default {
  title: 'Components/ProductSummary',
  component: ProductSummary,
};

const Template = (args) => ({
  components: { ProductSummary },
  template:
    `<ProductSummary v-bind="args" />`,
  setup() {
    return { args }
  }
});

export const Default = Template.bind({})
Default.args = {
  isLoggedIn: true,
  product: {
    id: 1,
    title: "明治 ザバス ウェイトダウン ヨーグルト風味",
    image_url: "https://images-fe.ssl-images-amazon.com/images/I/51MRScMCrKL.jpg",
    url: 'example.com',
    price: '1,234',
    brand_amazon_name: "SAVAS(ザバス)",
    is_likes: false
  }
}
