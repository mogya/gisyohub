<template>
  <div class="container">
    <Tweet :id="tweet.id_str">{{tweet.text}}</Tweet>
    <h2>本を登録</h2>
    <p class='message'>このツイートから、「書名」が登録されています</p>
    
  </div>
</template>

<script>
import { Tweet } from 'vue-tweet-embed'
export default {
  validate ({ params }) {
    // must be number.
    return /^\d+$/.test(params.id)
  },
  components: {
    Tweet: Tweet
  },
  data: ()=>{
    return {
    }
  },
  methods: {
  },
  async asyncData ({ $axios, params }) {
    const tweet = await $axios.$get(`/api/tweets/${params['id']}`)
    console.log(tweet)
    return { tweet: tweet }
  },
  beforeMount() {
    console.log(this.tweet)
  },
  middleware ({ app, redirect }) {
    if (app.$auth){
      if (app.$auth.hasScope('worker')){
      }else{
        console.log('user is logged-in but no privillage')
        return redirect(app.$front_url('/sessions/new'))
      }
    }else{
      console.log('user is not logged-in')
      return redirect(app.$front_url('/sessions/new'))
    }
  }
}
</script>

<style>
</style>
