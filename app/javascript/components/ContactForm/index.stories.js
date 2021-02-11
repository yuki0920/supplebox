import ContactForm from './index'
import store from '../sample_store'

export default {
  title: 'Components/ContactForm/Default',
  component: ContactForm,
};

const Template = () => ({
  components: { ContactForm },
  template: '<ContactForm />',
  store
});

export const Default = Template.bind({})
