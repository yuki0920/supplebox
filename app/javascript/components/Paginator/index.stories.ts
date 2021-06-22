import Paginator from './index.vue'

export default {
  title: 'Components/Paginator',
  component: Paginator,
};

const Template = (args) => ({
  components: { Paginator },
  template: '<Paginator v-bind="args"/>',
  setup() {
    return { args };
  },
});

export const Default = Template.bind({})
Default.args = {
  totalPages: 5,
}
