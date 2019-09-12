<template>
    <div class="container" >
        <img class="imgResult" src="../assets/logo_site.png" alt="logo" id="logoSite">
      <div id="userOptions">
        <div id="parameters">
          <div class="square">
            <div class="openModal" v-on:click='showDistance = !showDistance'></div>
            <img class="imgResult" src="../assets/blanc/svg/plane.svg" alt="plane">
            <p>distance</p>
            <transition enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
            <div v-show="showDistance" class="modal">
              <input type="number" placeholder="choisis ta distance" v-model="distance">
            </div>
          </transition>
          </div>

          <div class="square">
            <div class="openModal" v-on:click='showBudget = !showBudget'></div>
            <img class="imgResult" src="../assets/blanc/svg/sounds.svg" alt="plane">
            <p>budget</p><transition enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
            <div v-show="showBudget" class="modal">
              <input type="text" placeholder="choisis ton budget maximum" v-model="budget">
            </div>
          </transition>
          </div>

          <div class="square" >
            <div class="openModal" v-on:click='showContinent = !showContinent'></div>
            <img class="imgResult customImg" src="../assets/world.svg" alt="world">
            <p>continent</p>
            <transition enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
            <div v-show="showContinent" class="modal" >
              <select name="" id="" v-model="continent">
                <option value="">-- Choisir le continent --</option>
                <option v-for="(data, index) in continentFromDb" >
                  {{data.nomCont}}
                </option>
              </select>
            </div>
          </transition>
          </div>

          <div class="square" >
            <div class="openModal" v-on:click='showMonths = !showMonths'></div>
            <img class="imgResult customImg" src="../assets/calendar.svg" alt="calendar">
            <p>mois</p><transition enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
            <div v-show="showMonths" class="modal" >
              <select name="" id="" v-model="month">
                <option value="">--Please choose a continent--</option>
                <option v-for="(data, index) in monthsFromDb" >
                  {{data.mois}}
                </option>
              </select>
            </div>
          </transition>
          </div>

          <div class="square" >
            <div class="openModal" v-on:click='showActivite = !showActivite'></div>
            <img class="imgResult" src="../assets/blanc/svg/bike.svg" alt="plane">
            <p>activité</p><transition enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
            <div v-show="showActivite" class="modal">
              <div v-for="(data, index) in activiteFromDb" class="activite">
                <input type="checkbox" :id="data.nomAct" v-model="activites" :value="data.nomAct">
                <label for="scales">{{data.nomAct}}</label>
              </div>

            </div>
          </transition>
          </div>
          <div class="square">
            <div class="openModal" v-on:click='showTemp = !showTemp'></div>
            <img class="imgResult" src="../assets/blanc/svg/brightness.svg" alt="plane">
            <p>température</p><transition enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
            <div v-show="showTemp" class="modal">
              <p>{{ temperature }} °</p>
              <input type="range" v-model="temperature" min="0" max="50" step="1" @change="updateTextInput">
            </div>
          </transition>
          </div>
        </div>
        <button v-on:click=getByAttributes id="validateBtn">ok</button>
      </div>
      <!-- :style="{ backgroundImage: `url(${require(`@/assets/${data.img}`)})`}" -->
         <transition-group v-show="showResults" name="list" tag="div" class="holder" enter-active-class="animated bounceIn" leave-active-class="animated bounceOut">
          <div class="city" v-for="(data, index) in citiesFromDb" :key='index' >
            <div class="cityImg" :style="{ backgroundImage: `url(${require(`@/assets/${data.image}`)})`}">
              <p>{{data.nomVille}}</p>
              <p style="font-size:15px">{{data.budgMin}}€</p>
              <p style="font-size:12px">{{data.tempMin}}°C - {{data.tempMax}}°c</p>
            </div>
          </div>
        </transition-group>
        <p v-show="!showResults" class="noRes">aucun resultat</p>


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
      showResults:true,
      showDistance:false,
      showMonths:false,
      showContinent:false,
      showBudget:false,
      showActivite:false,
      showTemp:false,
      continentFromDb:[],
      citiesFromDb:[],
      activiteFromDb:[],
      monthsFromDb:[],
      continent:"",
      temperature:"",
      distance:"",
      month:"Septembre",
      budget:"",
      activites:[]
    }
  },
  methods:{
    getByAttributes: function (params) {
      this.citiesFromDb=[]
      axios.get("http://localhost:8000/api.php?search=true&temperature="+this.temperature+"&nomCont="+this.continent+"&budget="+this.budget+"&nomAct="+this.activites+"&distance="+this.distance+"&mois="+this.month)
      .then(response => {        
        if(response.data.cities.length==0){
          this.showResults=false
        }
        else{
          this.citiesFromDb=response.data.cities;
          this.showResults=true
        }
      })
    },
    updateTextInput: function (e) {
      this.temperature= e.target.value;
    }
  },
  mounted(){
    // axios to get cities
    axios.get("http://localhost:8000/api.php")
    .then(response => {
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
.customImg{
  width: 25px;
}
#logoSite{
  width: 300px;
  margin: auto;
  margin-top: 100px;
  margin-bottom: 50px;
  display: block;
}
.modal input{
  background-color: transparent;
  text-align: center;
  color: white;
}

body, body div#app{
  height: 100%;
}
.modal *{
  text-align: center;
  background-color: transparent;

}
.noRes{
  color: #fff;
  text-align: center;
  font-weight: 800;
  text-transform: uppercase;
}
#userOptions{
  display: flex;
  flex-direction: column;
  justify-content: center;
}
#validateBtn{
width: 100px;
height: 30px;
background-color: #c8802a;
border-radius: 15px;
align-self: center;
margin: 30px 0;
font-weight: bold;
color: white;
transition: all 0.2s;
}
#validateBtn:hover{
  background-color: #e3bb8a;
}


 .holder {
    background: #ffffff75;
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
    background-size: 100% 100%;
text-align: center;
padding-top: 58px;
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
    width: 150px;
    height: 150px;
    background: #337171;
    margin: 20px 25px;
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
    padding: 12px;
    z-index: 1;
    color: #fff;
    top:20px;
    border-radius: 15px;
    background-color: #40AFAA;
    text-align: center;

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
