<template>
  <div class="container">
    <div id="editor">
      <textarea @input="update"># hello</textarea>
      <div v-html="compiled"></div>
    </div>
  </div>
</template>

<script>
import debounce from 'lodash/debounce'
export default {
  data: ()=>{
    return {
      compiled: '',
    }
  },
  computed: {
  },
  methods: {
    update: debounce(function (e) {
      this.compiled = this.$md.render(e.target.value)
    }, 300)
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
}

#editor textarea{
  width: 500px;
  height: 10em;
}
</style>
