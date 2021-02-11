import FlashMessage from './index'

export default {
  title: 'Components/FlashMessage',
  component: FlashMessage,
  argTypes: {
    messageText: { control: { type: 'select', options: ['送信に成功しました', '送信に失敗しました']} },
    messageType: { control: { type: 'select', options: ['primary', 'danger']} }
  },
};

const Template = (args, { argTypes }) => ({
  props: Object.keys(argTypes),
  components: { FlashMessage },
  template: `<FlashMessage :messageText="messageText" :messageType="messageType" />`,
});

export const Primary = Template.bind({})
Primary.args = {
  messageText: '送信に成功しました',
  messageType: 'primary'
}

export const Danger = Template.bind({})
Danger.args = {
  messageText: '送信に失敗しました',
  messageType: 'danger'
}
