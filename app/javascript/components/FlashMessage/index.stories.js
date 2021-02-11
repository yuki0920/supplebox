import FlashMessage from './index'
import store from '../sample_store'
import { mapMutations } from 'vuex'

export default {
  title: 'Components/FlashMessage',
  component: FlashMessage,
  argTypes: {
    text: { control: { type: 'select', options: ['送信に成功しました', '送信に失敗しました']} },
    type: { control: { type: 'select', options: ['primary', 'danger']} }
  },
};

const Template = (args, { argTypes }) => ({
  props: Object.keys(argTypes),
  components: { FlashMessage },
  template: `
    <div>
      <FlashMessage />
      <button class="btn btn-success" @click="flashMessage()">
        送信する
      </button>
    </div>
  `,
  methods: {
    ...mapMutations(['setMessage']),
    flashMessage() {
      this.setMessage({ text: this.text, type: this.type })
    },
  },
  store
});

export const Primary = Template.bind({})
Primary.args = {
  text: '送信に成功しました',
  type: 'primary'
}

export const Danger = Template.bind({})
Danger.args = {
  text: '送信に失敗しました',
  type: 'danger'
}
