<template>
  <div id="app">
    <ville msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
import ville from './components/ville.vue'

export default {
  name: 'app',
  components: {
    ville
  }
}
</script>

<style>

@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700');

body {
  background-color: #EEEEEE;
  font-family: 'Montserrat', sans-serif;
}
body, html {
  margin: 0;
}
#app {
    padding: 5px;
}
</style>
