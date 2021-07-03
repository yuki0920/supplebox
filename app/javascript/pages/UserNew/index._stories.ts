import UserNew from './index.vue'

export default {
  title: 'Pages/UserNew',
  component: UserNew,
};

const Template = () => ({
  components: { UserNew },
  template: '<UserNew />',
});

export const Default = Template.bind({})
