const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require("./loaders/vue");
const path = require('path')
const webpack = require('webpack')
const { DefinePlugin } = require('webpack')
const ts = require("./loaders/ts")

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend("ts", ts)

environment.config.resolve.alias = {
  '@axios': path.resolve(__dirname, '../../app/javascript/packs/initializers/axios.js'),
  '@': path.resolve(__dirname, "..", "..", "app/javascript/src")
}

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)

// NOE: 実行時にWarningが出ないための設定
environment.plugins.prepend(
  'Define',
  new DefinePlugin({
    __VUE_OPTIONS_API__: false,
    // or __VUE_OPTIONS_API__: true,
    __VUE_PROD_DEVTOOLS__: false
  })
)

module.exports = environment
