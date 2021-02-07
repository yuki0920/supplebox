import ContactForm from './ContactForm'

export default {
  title: 'Components/ContactForm/Default',
  component: ContactForm,
};

const Template = () => ({
  components: { ContactForm },
  template: '<ContactForm />'
});

export const Default = Template.bind({})
