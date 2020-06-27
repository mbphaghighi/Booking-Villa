<template>
    <div>
        <h6 class="text-uppercase text-secondary font-weight-bolder">Price breakdown</h6>
        <div v-for="(days, price) in price.breakDown " :key='price' class="pt-2 pb-2 border-bottom border-top d-flex justify-content-between">
            <span>{{days}}* ${{price}}</span>
            <span>${{days*price}}</span>
            </div>
        <div class="font-weight-bolder d-flex justify-content-between pt-2">
            <span>Total</span>
            <span>${{price.totalPrice}}</span>
             </div>
    </div>
</template>

<script>
    export default {
        name: "price",
        props:{
            price:Object,
        }
    }
</script>

<style scoped>

</style>