import ProductItems from './index.vue'
import { Default as ProductItem } from '../ProductItem/index.stories'

export default {
  title: 'Components/ProductItems',
  component: ProductItems,
}

const Template = (args) => ({
  components: { ProductItems },
  template:
    `<ProductItems v-bind="args" />`,
  setup() {
    return { args }
  }
})

export const Default = Template.bind({})
Default.args = {
  products: [
    ProductItem.args.product,
    ProductItem.args.product,
    ProductItem.args.product,
    ProductItem.args.product,
    ProductItem.args.product,
    ProductItem.args.product,
    ProductItem.args.product,
    ProductItem.args.product
  ]
}
