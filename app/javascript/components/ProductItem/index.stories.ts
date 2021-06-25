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
    product_link: "/products/2",
    brand_amazon_name: "SAVAS(ザバス)",
    post_count: "6",
    rate: 3.4,
    likes: 12,
    is_likes: false
  }
}

export const LoginLiked = Template.bind({})
LoginLiked.args = {
  product: {
    ...Default.args.product,
    is_likes: true
  },
  isLogin: true,
}

export const LoginNotLiked = Template.bind({})
LoginNotLiked.args = {
  product: {
    ...Default.args.product,
    is_likes: false
  },
  isLogin: true,
}
