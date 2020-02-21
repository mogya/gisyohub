<template>
  <div class="container mx-auto">
    <Tweet :id="tweet.id_str">
      {{tweet.text}}
    </Tweet>
    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 class="text-xl font-medium">本を登録</h2>
      <p class='message'>このツイートから、「書名」が登録されています</p>
      <div class="mb-4">
        <input class="input-style focus:outline-none focus:shadow-outline" id="bookname" type="text" placeholder="bookname" />
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold w-3/12 py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
          登録
        </button>
      </div>
    </form>

    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 class="text-xl font-medium">キーワードを登録</h2>
      <p class='message'>このツイートから、「キーワード」が登録されています</p>
      <div class="mb-0">
        <select class="select-style focus:outline-none focus:shadow-outline">
          <option value="1">本の名前1</option>
          <option value="2">本の名前2</option>
          <option value="3">本の名前3</option>
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
      <div class="mb-4">
        <input class="input-style focus:outline-none focus:shadow-outline" id="keyword" type="text" placeholder="keyword" />
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold w-3/12 py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
          登録
        </button>
      </div>
    </form>

    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 class="text-xl font-medium">出展者として登録</h2>
      <div class="mb-0">
        <select class="select-style focus:outline-none focus:shadow-outline">
          <option value="1">イベントの名前1</option>
          <option value="2">イベントの名前2</option>
          <option value="3">イベントの名前3</option>
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
      <div class="mb-4">
        <input class="input-style focus:outline-none focus:shadow-outline" id="placename" type="text" placeholder="keyword" />
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold w-3/12 py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
          登録
        </button>
      </div>
    </form>
    
    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <h2 class="text-xl font-medium">イベント出展物として登録</h2>
      <div class="mb-0">
        <select class="select-style focus:outline-none focus:shadow-outline">
          <option value="1">イベントの名前1</option>
          <option value="2">イベントの名前2</option>
          <option value="3">イベントの名前3</option>
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
      </div>
      <div class="mb-4">
        <select class="select-style focus:outline-none focus:shadow-outline">
          <option value="1">本の名前1</option>
          <option value="2">本の名前2</option>
          <option value="3">本の名前3</option>
        </select>
        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
          <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
        </div>
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold w-3/12 py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
          登録
        </button>
      </div>
    </form>
    
  </div>
</template>

<script>
import { Tweet } from 'vue-tweet-embed'
export default {
  validate ({ query }) {
    // must be number.
    return /^\d+$/.test(query.id)
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
  async asyncData ({ $axios, query }) {
    const tweet = await $axios.$get(`/api/tweets/${query.id}`)
    console.log(tweet)
    return { tweet: tweet }
  },
  beforeMount() {
    console.log(this.tweet)
  },
  middleware: 'must_be_worker'
}
</script>
<style>
.twitter-tweet {margin:auto;}
.select-style {
  @apply shadow border rounded w-8/12 py-2 px-2 text-gray-700 leading-tight;
}
.input-style {
  @apply shadow appearance-none border rounded w-8/12 py-2 px-3 text-gray-700 leading-tight;
}
</style>
