<template>
    <div>
        <h2 class="alert alert-info">SecondApp입니다</h2>
        <h4>src의 이미지를 배열로 반복하기</h4>
        <div class="photo">
            <img v-for="(photos,idx) in imgArr" :key="'photos'+idx" :src="photos" class="img">
        </div>

        <h4>public의 이미지를 배열로 반복하기_절대주소 or 상대주소</h4>
        <div class="photo">
            <img v-for="(myphoto,idx) in imgArr2" :key="'myphoto'+idx" :src="`/image/jquery_img/0${myphoto}.png`">
        </div>   
    </div>
</template>

<script>

import img1 from '@/assets/연예인사진/1.jpg';
import img2 from '@/assets/연예인사진/2.jpg';
import img3 from '@/assets/연예인사진/3.jpg';
import img4 from '@/assets/연예인사진/4.jpg';
export default {
    setup () {
        
        const imgArr=[img1,img2,img3,img4];

        const imgArr2=[1,2,3,4];

        return {imgArr,imgArr2}
    }
}
</script>

<style>
.img{
    width: 150px;
    height: 180px;
    border-radius: 20px;
    margin: 10px;
}
</style>