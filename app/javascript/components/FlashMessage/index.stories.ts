import FlashMessage from './index.vue'

export default {
  title: 'Components/FlashMessage',
  component: FlashMessage,
}

const Template = (args) => ({
  components: { FlashMessage },
  template: `
    <FlashMessage v-bind="args" />
  `,
  setup() {
    return { args }
  }
})

export const Primary = Template.bind({})
Primary.args = {
  title: '問い合わせ',
  isShow: true,
  isSuccess: true
}

export const Danger = Template.bind({})
Danger.args = {
  title: '問い合わせ',
  isShow: true,
  isSuccess: false
}
