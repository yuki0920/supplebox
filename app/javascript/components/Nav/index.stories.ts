import Nav from './index.vue'

export default {
  title: 'Components/Nav',
  component: Nav,
};

const Template = (args) => ({
  components: { Nav },
  setup() {
    return { args }
  },
  template: '<Nav v-bind="args" />',
});

export const Default = Template.bind({})
Default.args = {
  user: {
    name: 'テストユーザー',
    pictureUrl: 'https://supplebox.s3.amazonaws.com/uploads/user/picture/2/kaisya_man.png'
  }
}

export const NoUser = Template.bind({})
NoUser.args = {
  user: null
}
