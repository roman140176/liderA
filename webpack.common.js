const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const isProd = process.env.NODE_ENV === 'prod'
const isDev = !isProd
module.exports = {
  entry: {
    app: path.resolve(__dirname, 'frontend/js/app.js'),
    components: path.resolve(__dirname, 'frontend/js/main.js'),
    bootstrap: path.resolve(__dirname, 'frontend/js/bootstrap.js'),
    dependencies: path.resolve(__dirname, 'frontend/js/dependencies.js')
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'themes/default/web/build'),
  },
  devtool: isDev ? 'source-map' : false,
  plugins: [new MiniCssExtractPlugin()],
  module: {
    rules: [
      {
        test: /\.s[ac]ss$/i,
        use: [
          MiniCssExtractPlugin.loader,
          // Translates CSS into CommonJS
          "css-loader",
          // Compiles Sass to CSS
          "postcss-loader",
          "sass-loader",
        ],
      },
       {
        test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: '[name].[ext]',
              outputPath: 'fonts/'
            }
          }
        ]
      },
       {
          test: /\.js$/,
          exclude: /(node_modules|bower_components)/,
          use: {
            loader: 'babel-loader',
            options: {
              presets: [['babel-preset-env',{
                debug:true,
                corejs:3,
                useBuiltIns:true
              }]]
            }
          }
        }
    ],
  },
};