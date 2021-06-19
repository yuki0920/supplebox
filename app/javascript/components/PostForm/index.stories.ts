import PostForm from './index.vue'

export default {
  title: 'Components/PostForm',
  component: PostForm,
};

const Template = () => ({
  components: { PostForm },
  template: '<PostForm />',
});

export const Default = Template.bind({})
