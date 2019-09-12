<template>
    <div class="container" id="bgk-pattern">
      <h1 id="title">admin</h1>
      
  </div>
</template>

<script>

import { log } from 'util';
const axios = require('axios');

export default {
  name: 'admin',

  data() {
    return {
     
    }
  },
  methods:{
    getByAttributes: function (params) {      
      
    }
  },
  mounted(){
    // axios to get cities
    axios.get("http://localhost:8000/api.php")
    .then(response => {
      console.log(response.data);
      this.citiesFromDb=response.data.cities
      this.continentFromDb= response.data.continent
      this.activiteFromDb=response.data.activite
      this.monthsFromDb=response.data.months
    })
  }

}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import "https://cdn.jsdelivr.net/npm/animate.css@3.5.1";
#bgk-pattern{
    width: 100%;
    background-attachment: fixed;
    background-color: transparent;
    background-position: center center;
    background-repeat: repeat, no-repeat;
    background-size: auto auto, cover;
    background-image: url('../assets/pattern.png'), linear-gradient( rgba(200, 193, 193, 0.46), rgba(0, 0, 0, 0.32) ), url('../assets/background.jpg');
    display: flex;
    flex-direction: column;
    justify-content: center;
}

#title{

  display: flex;

  flex-direction: column;

  justify-content: center;

  align-items: center;

}

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
    background-size: 100% 100%;
    overflow: hidden;
    position: relative;
  }

  .cityImg:hover{
    transform: scale(1.3);
  }

  .cityImg{
    transition: all .3s ease-in-out;
    position: absolute;
    width: 100%;
    height: 100%;
    padding-top: 58px;
    background-size: 100% 100%;
   text-align: center;
  }
  .city p{
     color:#fff;
     font-weight: 800;
     text-transform: uppercase;
     font-size: 20px;
  }
.activite{
  display: flex;
}
  #parameters{
    display: flex;
    width:800px;
    justify-content: center;
    flex-wrap: wrap;
    margin: 0 auto;
  }
  .square{
    position: relative;
    width: 100px;
    height: 100px;
    background: #337171;
    margin: 6px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    border: 0 solid;
  box-shadow: inset 0 0 20px rgba(255, 255, 255, 0);
  outline: 1px solid;
  outline-color: rgba(255, 255, 255, .5);
  outline-offset: 0px;
  text-shadow: none;
  transition: all 1250ms cubic-bezier(0.19, 1, 0.22, 1);
  flex-direction: column;
  color:white;
  padding: 20px;
  }
  .square:hover {

  border: 1px solid;

  box-shadow: inset 0 0 20px rgba(255, 255, 255, .5), 0 0 20px rgba(255, 255, 255, .2);

  outline-color: rgba(255, 255, 255, 0);

  outline-offset: 15px;

  text-shadow: 1px 1px 2px #427388;

}

  .openModal{    
    cursor: pointer;
    position: absolute;
    width: 100%;
    height: 100%;
  }

  .modal{
    position: absolute;
    background: #000;
    padding: 12px;
    z-index: 1;
    color: #fff;
    top:100px;
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

  button{
    margin: 10ox auto;
    background: #3EB3F6;
    display: inline-block;
    padding: 8px 12px;
    border: none;
  }

    input {
    border: 0;
    padding: 5px;
    font-size: 12;
    background-color: #323333;
    color: #687F7F;
  }
</style>
