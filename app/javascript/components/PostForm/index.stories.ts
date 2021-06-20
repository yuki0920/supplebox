import PostForm from './index.vue'

export default {
  title: 'Components/PostForm',
  component: PostForm,
};

const Template = (args) => ({
  components: { PostForm },
  template: '<PostForm v-bind="args"/>',
  setup() {
    return { args };
  },
});

export const New = Template.bind({})
New.args = {
  head: '口コミを投稿する',
  title: '',
  rate: 5,
  content: '',
}

export const Edit = Template.bind({})
Edit.args = {
  head: '口コミを編集する',
  title: 'おいしい',
  rate: 3,
  content: 'コクがありおいしいです',
}
