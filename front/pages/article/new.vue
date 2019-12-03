<template>
  <div class="container">
    <div id="editor">
      <textarea id="input" @input="update"># hello</textarea>
      <div v-html="compiled"></div>
      <button @click="onclickButton">publish</button>
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
      if (this.$localStorage){
        this.$localStorage.setItem('input', e.target.value);
      }
    }, 300),
    onclickButton: ()=>{
      console.log('save')
    },
  },
  mounted: function () {
    console.log('beforeMount')
    const el = document.getElementById('input');
    if (this.$localStorage){
      const inputValue = this.$localStorage.getItem('input');
      if (inputValue){ 
        el.value = inputValue
      }else{
        this.$localStorage.setItem('input', el.value)
      }
    }
    this.compiled = this.$md.render(el.value)
  },
  asyncData: function () {
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
