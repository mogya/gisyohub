export default ({ $axios, app, req, error }) => {
  /**
   * $axios.onRequest
   */
  $axios.onRequest(config => {
    console.log('$axios.onRequest: ' + config.url)
    config.headers['x-csrf-token'] = app.$cookies.get('x-csrf-token')
  })
}
