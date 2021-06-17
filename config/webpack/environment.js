const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const path = require('path')
const webpack = require('webpack')
const { DefinePlugin } = require('webpack')
const vue = require("./loaders/vue")
const ts = require("./loaders/ts")

environment.config.resolve.alias = {
  '@axios': path.resolve(__dirname, '../../app/javascript/packs/initializers/axios.ts'),
  '@': path.resolve(__dirname, "..", "..", "app/javascript/")
}

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
// NOE: 実行時にWarningが出ないための設定
environment.plugins.prepend(
  'Define',
  new DefinePlugin({
    __VUE_OPTIONS_API__: false,
    // or __VUE_OPTIONS_API__: true,
    __VUE_PROD_DEVTOOLS__: false
  })
)
environment.loaders.prepend("ts", ts)
environment.loaders.prepend('vue', vue)

module.exports = environment
