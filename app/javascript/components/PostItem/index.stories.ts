import PostItem from './index.vue'

export default {
  title: 'Components/PostItem',
  component: PostItem,
};

const Template = (args) => ({
  components: { PostItem },
  template:
    `<PostItem v-bind="args" />`,
  setup() {
    return { args }
  }
});

export const Default = Template.bind({})
Default.args = {
  post: {
    id: 1,
    title: 'テストタイトル',
    content: 'テスト口コミ内容',
    rate: 2.0,
    picture_url: null,
    is_owner: true,
    edit_path: 'https://example.com',
    created_at: "2021/01/11 12:00",
    user: {
      picture_url: 'https://supplebox.s3.amazonaws.com/uploads/user/picture/2/kaisya_man.png',
      name: 'テストユーザー',
      path: 'https://supplebox.jp/users/2',
      gender: '男性',
      height: '170〜175cm',
      weight: '100kg超',
    },
    product: {
      image_url: 'https://images-fe.ssl-images-amazon.com/images/I/51MRScMCrKL.jpg',
      path: 'https://example.com',
      title: 'テストプロテイン'
    }
  }
}
