<template>
    <div class="container" id="bgk-pattern">
      <h1>CityGetter <span>for the better</span></h1>
      <div id="userOptions">
        <div id="parameters">
          <div class="square" v-on:click='showDistance = !showDistance'><p>distance</p></div>
          <div v-show="showDistance">
            <input type="text" placeholder="choisis ta distance" v-model="distance">
          </div>
          <div class="square" v-on:click='showBudget = !showBudget'><p>budget</p></div>
          <div v-show="showBudget">
            <input type="text" placeholder="choisis ton budget">
          </div>
          <div class="square" v-on:click='showContinent = !showContinent'><p>continent</p></div>
          <div v-show="showContinent">
            <select name="" id="" v-model="continent">
              <option value="">--Please choose an option--</option>
              <option v-for="(data, index) in continentFromDb" >
                {{data.nomCont}}
              </option>
            </select>
          </div>
          <div class="square"><p>activité</p></div>
          <div class="square"><p>température</p></div>
        </div>
        <button v-on:click=getByAttributes>ok</button>
      </div>
      
      {{continent}}
      <!-- :style="{ backgroundImage: `url(${require(`@/assets/${data.img}`)})`}" -->
      <transition-group name="list" tag="div" class="holder" enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
        <div class="city" v-for="(data, index) in citiesFromDb" :key='index' :style="{ backgroundImage: `linear-gradient( rgba(0, 0, 0, 0.30), rgba(0, 0, 0, 0.30) ),url(${require(`@/assets/${data.image}`)})`}">
          <p>{{data.nomVille}}</p>
        </div>
      </transition-group>
      <p>These are the cities that we recommend.</p>
  </div>
</template>

<script>
import { log } from 'util';
const axios = require('axios');

export default {
  name: 'ville',
  props: {
    msg: String,
  },
  data() {
    return {
      city: '',
      showDistance:false,
      showContinent:false,
      distance:"",
      showBudget:false,
      continentFromDb:[],
      citiesFromDb:[],
      activiteFromDb:[],
      monthsFromDb:[],
      continent:"",
      temperature:"",


    }
  },
  methods:{
    getByAttributes: function (params) {
      console.log("nefzkn");
      
      axios.get("http://localhost:8000/api.php?search=true&tmp="+this.temperature+"&nomCont="+this.continent+"&budget="+this.temperature+"&activite="+this.temperature+"&mois=")
      .then(response => {
        console.log(response.data);
        this.citiesFromDb=response.data.cities
      })
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
  height: 100vh;
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
  
  }

  .city p{
     color:#fff;
     font-weight: 800;
     text-transform: uppercase;
     font-size: 20px;
  }

  #parameters{
    display: flex;
    width:800px;
    justify-content: center;
    flex-wrap: wrap;
    margin: 0 auto;
  }
  .square{
    width: 100px;
    height: 100px;
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

  button{
    margin: 10ox auto;
    background: #3EB3F6;
    display: inline-block;
    padding: 8px 12px;
    border: none;
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
