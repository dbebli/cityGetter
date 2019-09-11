<template>
    <div class="container">
      <div id="parameters">
        <div class="square"><p>température</p></div>
        <div class="square"><p>température</p></div>
        <div class="square"><p>température</p></div>
        <div class="square"><p>température</p></div>
        <div class="square"><p>température</p></div>
        <div class="square"><p>température</p></div>
      </div>
    <div class="holder">
      <!-- :style="{ backgroundImage: `url(${require(`@/assets/${data.img}`)})`}" -->
      <div class="city" v-for="(data, index) in cities" :key='index' :style="{ backgroundImage: `url(${require(`@/assets/${data.image}`)})`}">
        <p>{{data.nomVille}}</p>
      </div>
    </div>
          <p>These are the cities that we recommend.</p>
  </div>
</template>

<script>
import { log } from 'util';
const axios = require('axios');

export default {
  name: 'ville',
  props: {
    msg: String
  },
  data() {
    return {
      city: '',
      cities: [
      ]
    }
  },
  mounted(){
    // axios to get cities
    axios.get('http://localhost:8000/api.php')
    .then(response => {
      console.log(response.data);
      this.cities=response.data
    })
  }
  
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import "https://cdn.jsdelivr.net/npm/animate.css@3.5.1";

 .holder {
    background: #fff;
    width: 100%;
    flex-wrap: wrap;
    display:flex;
  }

  .city{
    width: 200px;
    height: 200px;
    background: #fff;
    margin: 6px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    border:2px solid red;
    background-size: 100% 100%;
  }

  .city p{
     color:#000;
  }

  #parameters{
    display: flex;
    width:800px;
    justify-content: center;
    flex-wrap: wrap;
    margin: 0 auto;
  }
  .square{
    width: 200px;
    height: 200px;
    background: #fff;
    margin: 6px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
  }

  ul {
    margin: 0;
    padding: 0;
    list-style-type: none;
  }
  
  ul li {
    padding: 20px;
    font-size: 1.3em;
    background-color: #E0EDF4;
    border-left: 5px solid #3EB3F6;
    margin-bottom: 2px;
    color: #3E5252;
  }


  .container {
    box-shadow: 0px 0px 40px lightgray;
  }

    input {
    width: calc(100% - 40px);
    border: 0;
    padding: 20px;
    font-size: 1.3em;
    background-color: #323333;
    color: #687F7F;
  }
</style>
