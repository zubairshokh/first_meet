const path = require('path');
const { VueLoaderPlugin } = require('vue-loader');

module.exports = {
  entry: './js/main.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, '../priv/static/js'),
    publicPath: '/js/'
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          reactivityTransform: true
        }
      },
      {
        test: /\.css$/,
        use: [
          'vue-style-loader',
          'css-loader'
        ]
      }
    ]
  },
  plugins: [
    new VueLoaderPlugin()
  ],
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm-bundler.js'
    }
  },
  mode: 'development'
};