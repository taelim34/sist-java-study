<template>
  <div>
      <img alt="Vue logo" src="./assets/logo.png">

      <div>
        <a class="menu" v-for="(menu,i) in menus" :key="i">{{ menu }}</a>
      </div>

      <div v-for="(product,key) in products" :key="key">
        <img :src="product.imgSrc" class="celeb">
        <h4>{{ product.name }}</h4>
        <h4>{{ product.company }}</h4>
        <button @click="like(product)">좋아요</button><span>좋아요 수: {{product.likes}}</span>
      </div>
      <!-- <a>Shop</a>
      <a>Board</a>
      <a>About</a> -->

      <!-- <h3>{{ cnt }}</h3>
      <button type="button" @click="">증가</button>
      <button type="button" @click="">감소</button> -->

      <h4></h4>
  </div>

</template>

<script>

export default {
  name: 'App',
  data(){
    return{

      cnt:0,
      menus:['Home','Shop','Board','About'],
      products:[{name:'김태희',company:'하이브',
      likes:0,imgSrc:require('./assets/연예인사진/10.jpg')},
      {name:'유아인',company:'JYP',
      likes:0,imgSrc:require('./assets/연예인사진/20.jpg')},
      {name:'수지',company:'하이브',
      likes:0,imgSrc:require('./assets/연예인사진/19.jpg')},
      {name:'강동원',company:'SM',
      likes:0,imgSrc:require('./assets/연예인사진/9.jpg')}
      ],

    }
  },
  methods:{
    like(prod){
      prod.likes++;
    }
  },
  components: {
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
.menu{
  background-color: blue;
}
a{
  color: white;
  padding: 10px;
}
.celeb{
  width: 150px;
  border-radius: 20px;
  margin-top: 20px;
}
</style>
