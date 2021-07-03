import NewUser from './index.vue'

export default {
  title: 'Pages/NewUser',
  component: NewUser,
};

const Template = () => ({
  components: { NewUser },
  template: '<NewUser />',
});

export const Default = Template.bind({})
