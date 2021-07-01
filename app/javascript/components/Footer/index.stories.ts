import Footer from './index.vue'

export default {
  title: 'Components/Footer',
  component: Footer,
}

const Template = (_) => ({
  components: { Footer },
  template: `
    <Footer />
  `,
})

export const Default = Template.bind({})
