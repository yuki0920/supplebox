import Cover from './index.vue'

export default {
  title: 'Components/Cover',
  component: Cover,
}

const Template = (args) => ({
  components: { Cover },
  template: `
    <Cover v-bind="args" />
  `,
  setup() {
    return { args }
  }
})

export const LoggedIn = Template.bind({})
LoggedIn.args = {
  isLoggedIn: true
}

export const NotLoggedIn = Template.bind({})
NotLoggedIn.args = {
  isLoggedIn: false
}
