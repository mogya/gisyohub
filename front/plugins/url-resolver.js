import Vue from 'vue'

export default ({ app, env }) => {
  app.$front_url = (path) => { return `${app.$axios.defaults.baseURL}${path}` }
}
