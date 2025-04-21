<template>
    <div class="container">
        <h2 class="alert alert-info">ThirdApp입니다</h2>
        <h2>Nav데이터</h2>
        <!-- <div v-for="(item,idx) in todayHome.navData" :key="'navitem'+idx">
            {{ item.title }}

        </div> -->
        <div v-for="(item,idx) in todayHome.navData" :key="'navitem'+idx" class="navData">
            <img :src="item.img" class="navimage"><br>
            <b>{{ item.title }}</b>
        </div>

        <h2>카테고리 데이터</h2>
        <!-- <div v-for="(item,idx) in  todayHome.categoryData" :key="'cate'+idx">
            {{ item.title }}
        </div> -->
        <div v-for="(item,idx) in todayHome.categoryData" :key="'cateitem'+idx" class="cateData">
            <img :src="item.img" class="cateimage"><br>
            <b>{{ item.title }}</b>
        </div>

        
    </div>
</template>

<script>
import todayHome from '@/assets/todayHome';

export default {
    setup () {

        return {todayHome}
    }
}
</script>

<style>

.navimage{
    border: 1px solid gray;
    border-radius: 10px;
    margin-left: 10px;
}
.cateimage{
    border: 1px solid gray;
    border-radius: 10px;
    margin: 10px;
}

.navData{
    float: left;
}
.cateData{
    float: left;
}

.container h2{
    clear: both;
}
</style>