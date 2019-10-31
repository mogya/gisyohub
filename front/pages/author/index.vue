<template>
  <div class="container">
    <div>
      <h1 class="title">
        gisyohub/author
      </h1>
      <h2 class="subtitle">
        My prime Nuxt.js project
      </h2>
      <div class="links" v-if="this.$auth.loggedIn">
        Hello {{ this.$auth.user.user_name }}.
        <button v-on:click="onclickLogout">Logout</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  middleware: 'auth',
  methods:{
    async onclickLogout(event){
      const ret = await this.$auth.logout()
      console.log(ret);
    }
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
