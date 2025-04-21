<template>
    <div>
        <label>
            <input type="radio" value="first" v-model="selected">first
        </label>
        <label>
            <input type="radio" value="second" v-model="selected">second
        </label>
        <label>
            <input type="radio" value="third" v-model="selected">third
        </label>
        <label>
            <input type="radio" value="fourth" v-model="selected">fourth
        </label>
        <label>
            <input type="radio" value="fifth" v-model="selected">fifth
        </label>
        <label>
            <input type="radio" value="sixth" v-model="selected">sixth
        </label>
        <label>
            <input type="radio" value="parent" v-model="selected">parent
        </label>
        
    </div>

    <!-- 선택된 컴포넌트로 랜더링 -->
     <component :is="currentComponent"></component>
</template>

<script>

import { computed, ref } from "vue";

import  FirstAppPage  from "./FirstApp.vue";
import  SecondAppPage  from "./SecondApp.vue";
import  ThirdAppPage  from "./ThirdApp.vue";
import  FourthAppPage  from "./FourthApp.vue";
import  FifthAppPage  from "./FifthApp.vue";
import  sixthAppPage  from "./sixthApp.vue";
import  parentAppPage  from "./ParentApp.vue";
export default {
    setup () {
        
        const selected=ref('first');

        const currentComponent=computed(()=>

            selected.value=='first'?FirstAppPage:
            selected.value=='second'?SecondAppPage:
            selected.value=='third'?ThirdAppPage:
            selected.value=='fourth'?FourthAppPage:
            selected.value=='fifth'?FifthAppPage:
            selected.value=='sixth'?sixthAppPage:parentAppPage
        )
        


        return {selected,currentComponent}
    }
}
</script>

<style lang="scss" scoped>

</style>