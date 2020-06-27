<template>
    <div class="d-flex">
        <i class="fas fa-star" v-for="star in fullStar" @click="$emit('input',star)"></i>
        <i class="fas fa-star-half-alt" v-if="halfStar"></i>
        <i class="far fa-star" v-for="star in emptyStar" @click="$emit('input',fullStar+star)"></i>
    </div>
</template>

<script>
    export default {
        name: "star-rating",
        props:{
            value:Number,
        },
        computed:{
            halfStar()
            {
                return false;
            },
            fullStar(){
                return Math.round(this.value);
            },
            emptyStar(){
                return 5-Math.ceil(this.value);
            }
        }
    }
</script>

<style scoped>

</style>