import ProductList from './index'

export default {
  title: 'Components/ProductList',
  component: ProductList,
  argTypes: {
  },
};

const Template = (args, { argTypes }) => ({
  props: Object.keys(argTypes),
  components: { ProductList },
  template: `<ProductList
    />`,
});

export const Default = Template.bind({})
Default.args = {
}
