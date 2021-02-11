import ContactForm from './index'
import store from '../sample_store'

export default {
  title: 'Components/ContactForm/Default',
  component: ContactForm,
};

const Template = () => ({
  components: { ContactForm },
  template: '<ContactForm />',
  computed: {
    message: {text: '送信が完了しました。', type: 'primary'}
  },
  store
});

export const Default = Template.bind({})
