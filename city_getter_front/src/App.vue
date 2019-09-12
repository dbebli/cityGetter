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
  height:100%;
    width: 100%;
    background-attachment: fixed;
    background-color: transparent;
    background-position: center center;
    background-repeat: repeat, no-repeat;
    background-size: auto auto, cover;
    background-image: url('./assets/pattern.png'), linear-gradient( rgba(200, 193, 193, 0.46), rgba(0, 0, 0, 0.32) ), url('./assets/background.jpg');
    display: flex;
    flex-direction: column;
    justify-content: center;
}
nav {
  padding: 20px 20px 20px 0;
  margin: 0 auto;
}

nav a {
  padding: 10px;
  text-decoration: none;
  background: rgb(95, 177, 181);
  border-radius: 3px;
  text-transform: uppercase;
  color: rgb(42, 63, 85);
  font-weight: bold;
  margin-right: 15px;
}
</style>
