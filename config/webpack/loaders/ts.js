module.exports = {
  test: /\.tsx$/,
  loader: "ts-loader",
  options: {
    appendTsSuffixTo: [/\.vue$/],
  },
  exclude: /node_modules/,
};
