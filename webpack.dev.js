const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
  mode: 'development',
  watch: true,
  watchOptions: {
    ignored: ['vendor/**', 'themes/**','protected/**', 'node_modules/**']
  },
  devtool: "source-map",
});