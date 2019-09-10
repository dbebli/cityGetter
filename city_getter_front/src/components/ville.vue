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
      <ul>
        <li v-for="(data, index) in cities" :key='index'>{{data.city}}</li>
      </ul>
      <p>These are the cities that we propose.</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ville',
  props: {
    msg: String
  },
  data() {
    return {
      city: '',
      cities: [
          { "city": "Vue.js" },
          { "city": "Frontend Developer" }
      ]
    }
  },
  mounted(){
    // axios to get cities
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
 .holder {
    background: #fff;
    width: 100%
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

  p {
    text-align:center;
    padding: 30px 0;
    color: gray;
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
