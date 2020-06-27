<template>
<div>
    <nav class="navbar bg-white navbar-expand-lg border-bottom navbar-light">
        <router-link class="navbar-brand mr-auto font-weight-bold" style="font-size: 2rem;" :to="{name:'home'}"> Villa Booking</router-link>
        <router-link class="btn nav-button btn-primary mr-2" v-if="isLoggedIn" :to="{name:'advertise'}">Advertise Your Villa</router-link>
        <ul class="navbar-nav">
            <li class="nav-item" v-if="isLoggedIn">
                <router-link class="btn nav-button" :to="{name:'basket'}">Booking Items
                    <span v-if="itemsInBasket" class="badge badge-secondary">{{itemsInBasket}}</span>
                </router-link>
            </li>
            <li class="nav-item" v-if="!isLoggedIn">
                <router-link :to="{name:'register'}" class="nav-link">Register</router-link>
            </li>
            <li class="nav-item" v-if="isLoggedIn">
                <router-link :to="{name:'profile',params:{id:user.id}}" class="nav-link">Profile</router-link>
            </li>
            <li class="nav-item" v-if="!isLoggedIn">
                <router-link :to="{name:'login'}" class="nav-link">Login</router-link>
            </li>
            <li class="nav-item" v-if="isLoggedIn">
            <a class="nav-link" href="#" @click.prevent="logout">Logout</a>
            </li>
        </ul>

    </nav>
    <div class="container mt-4 mb-4 pr-4 pl-4">
        <router-view/>
    </div>

</div>
</template>

<script>
    import {mapState, mapGetters} from 'vuex';
    export default {
        name: "index",
        computed:{
            ...mapState({
              lastSearchComputed:'lastSearch',
                isLoggedIn:'isLoggedIn',
                user:'user'
            }),
            ...mapGetters({
                itemsInBasket:'itemsInBasket',
            })
        },
        methods:{
            async logout(){
                try{
                    axios.post(`/logout`);
                    this.$store.dispatch('logout');
                    this.$router.push({ name: "home" });
                }
                catch(error){
                    this.$store.dispatch('logout');
                }
            }
        }
    }
</script>

<style scoped>

</style>