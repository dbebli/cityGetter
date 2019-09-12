<template>
  <div id="app">
    <nav>
        <router-link to="/">cities</router-link>
        <router-link to="/admin">back office</router-link>
      </nav>
    <router-view/>
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
nav {
  padding: 20px 20px 20px 0;
}

nav a {
  padding: 10px;
  text-decoration: none;
  background: #fff;
  border-radius: 3px;
  color: rgb(0, 110, 255);
  font-weight: bold;
  margin-right: 15px;
}
</style>
