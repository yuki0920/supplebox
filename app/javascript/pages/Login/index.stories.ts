import Login from './index.vue'

export default {
  title: 'Pages/Login',
  component: Login,
};

const Template = () => ({
  components: { Login },
  template: '<Login />',
});

export const Default = Template.bind({})
