import LikeButton from './index.vue'

export default {
  title: 'Components/LikeButton',
  component: LikeButton,
};

const Template = (args) => ({
  components: { LikeButton },
  template:
    `<LikeButton v-bind="args" />`,
  setup() {
    return { args }
  }
});

export const Like = Template.bind({})
Like.args = {
  productId: 1,
  isLiked: false,
}

export const Unlike = Template.bind({})
Unlike.args = {
  productId: 1,
  isLiked: true,
}

export const LargeLike = Template.bind({})
LargeLike.args = {
  productId: 1,
  isLiked: false,
  isLarge: true,
}

export const LargeUnlike = Template.bind({})
LargeUnlike.args = {
  productId: 1,
  isLiked: false,
  isLarge: true,
}
