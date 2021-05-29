const PnpWebpackPlugin = require('pnp-webpack-plugin')

module.exports = {
  test: /\.tsx$/,
  loader: "ts-loader",
  options: PnpWebpackPlugin.tsLoaderOptions({
    appendTsSuffixTo: [/\.vue$/]
  }),
  exclude: /node_modules/,

};
