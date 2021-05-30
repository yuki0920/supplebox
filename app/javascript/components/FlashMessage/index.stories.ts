import FlashMessage from './index.vue'

export default {
  title: 'Components/FlashMessage',
  component: FlashMessage,
  argTypes: {
    isDisplay: true,
    messageText: { control: { type: 'select', options: ['送信に成功しました', '送信に失敗しました']} },
    messageType: { control: { type: 'select', options: ['primary', 'danger']} }
  },
};

const Template = (args) => ({
  components: { FlashMessage },
  template: `
    <FlashMessage v-bind="args" />
  `,
  setup() {
    return { args }
  }
});

export const Primary = Template.bind({})
Primary.args = {
  isDisplay: true,
  messageText: '送信に成功しました',
  messageType: 'primary'
}

export const Danger = Template.bind({})
Danger.args = {
  isDisplay: true,
  messageText: '送信に失敗しました',
  messageType: 'danger'
}
