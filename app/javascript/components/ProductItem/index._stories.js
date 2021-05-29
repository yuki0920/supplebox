import ProductItem from './index'

export default {
  title: 'Components/ProductItem',
  component: ProductItem,
  argTypes: {
    ProductItem: {}
  },
};

const Template = (args, { argTypes }) => ({
  props: Object.keys(argTypes),
  components: { ProductItem },
  template: `<ProductItem
      :product="product"
    />`,
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
