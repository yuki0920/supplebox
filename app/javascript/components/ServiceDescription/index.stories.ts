import ServiceDescription from './index.vue'

export default {
  title: 'Components/ServiceDescription',
  component: ServiceDescription,
};

const Template = () => ({
  components: { ServiceDescription },
  template:
    `<ServiceDescription />`,
});

export const Default = Template.bind({})
