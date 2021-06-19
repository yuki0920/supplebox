const path = require('path')

module.exports = {
  "stories": [
    "../stories/**/*.stories.mdx",
    "../stories/**/*.stories.@(js|jsx|ts|tsx)",
    "../app/javascript/**/*.stories.@(js|jsx|ts|tsx)",
  ],
  "addons": [
    "@storybook/addon-links",
    "@storybook/addon-essentials"
  ],

  webpackFinal: async (config) => {
    config.resolve.alias['@axios'] = path.resolve(__dirname, '../app/javascript/packs/initializers/axios.ts');
    config.resolve.alias['@'] = path.resolve(__dirname, '../app/javascript/');

    config.module.rules.push({
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'sass-loader'],
      include: path.resolve(__dirname, '../'),
    });

    return config;
  },
}
