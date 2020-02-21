const webpack = require('webpack')
export default {
  mode: 'spa',
  server: {
    host: '0.0.0.0',
    port: process.env.PORT
  },
  /*
  ** Headers of the page
  */
  head: {
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=640, initial-scale=1' },
      { hid: 'description', name: 'description', content: process.env.npm_package_description || '' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },
  /*
  ** Global CSS
  */
  css: [
  ],
  /*
  ** Plugins to load before mounting the App
  */
  plugins: [
    '~/plugins/csrf-handler',
    '~/plugins/url-resolver',
    { src: '~/plugins/localstorage', mode: 'client' }
  ],
  /*
  ** Nuxt.js dev-modules
  */
  buildModules: [
    '@nuxtjs/tailwindcss'
  ],
  /*
  ** Nuxt.js modules
  */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    '@nuxtjs/auth',
    '@nuxtjs/proxy',
    '@nuxtjs/pwa',
    ['cookie-universal-nuxt', { parseJSON: false }],
    '@nuxtjs/markdownit'
  ],
  configureWebpack: {
    devtool: 'source-map'
  },
  /*
  ** Axios module configuration
  ** See https://axios.nuxtjs.org/options
  */
  axios: {
    host: process.env.API_HOST,
    port: process.env.API_PORT,
  },
  auth: {
    redirect: {
      login: '/sessions/new',   // 未ログイン時に認証ルートへアクセスした際のリダイレクトURL
    },
    strategies: {
      local: {
        endpoints: {
          user: { url: '/sessions/', method: 'get', propertyName: false },
          logout: { url: '/sessions/destroy', method: 'post', propertyName: false },
        },
        tokenRequired: false,
        tokenType: false
      }
    }
  },
  markdownit: {
    preset: 'default',
    injected: true,
    breaks: true,
    html: false,
    linkify: true,
    typography: true,
    xhtmlOut: true,
    langPrefix: 'language-',
    quotes: '“”‘’',
    highlight: function (/*str, lang*/) { return ''; },
    use: [
      'markdown-it-emoji'
    ]
  },
  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend (config, ctx) {
      // if (!ctx.isDev) {
      //   config.output.publicPath = '_nuxt/'
      // }
    }
  }
}
