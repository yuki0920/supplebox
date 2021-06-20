import ContactForm from './index.vue'

export default {
  title: 'Components/ContactForm',
  component: ContactForm,
};

const Template = () => ({
  components: { ContactForm },
  template: '<ContactForm />',
});

export const Default = Template.bind({})
