export const useMetaTags = (title: string) => {
  const description = `${title}のプロテインの口コミサイトです。プロテイン選びにお役立てください。`

  return [
    // NOTE: Google Analytics の検索ワードで漏れているキーワードを追加する
    { hid: 'description', name: 'description', content: description },
    { hid: 'keyword', name: 'keyword', content: `${title},プロテイン,口コミ,ランキング` }
    // { hid: 'og:description', property: 'og:description', content: description },
    // { hid: 'og:locale', property: 'og:locale', content: 'ja_JP' },
    // { hid: 'og:type', property: 'og:type', content: 'website' },
    // { hid: 'og:site_name', property: 'og:site_name', content: 'SuppleBox' },
    // { hid: 'og:title', property: 'og:title', content: `${title} | SuppleBox` },
    // { hid: 'og:url', property: 'og:url', content: `${location.href}` },
    // { hid: 'article:author', property: 'article:author', content: 'https://www.facebook.com/ywsep20/' },
    // { hid: 'og:image', property: 'og:image', content: '~/assets/img/ogp.jpg' },
    // { hid: 'twitter:card', name: 'twitter:card', content: 'summary' },
    // { hid: 'twitter:site', name: 'twitter:site', content: '@YukiWebTech' }
  ]
}
