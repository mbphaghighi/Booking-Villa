<template>
    <div>
    <div class="row">
        <div class="col-md-8 mb-4">
            <h1 class="mb-4">{{bookable.title}}</h1>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="../bookables/Images/Slider/a.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="../bookables/Images/Slider/b.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="../bookables/Images/Slider/c.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="../bookables/Images/Slider/d.jpg" alt="Fourth slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card mt-2 mb-2">
                <div class="card-body">
                    <h2>Address</h2>
                    <hr>
                    <article class="d-inline mr-5">{{bookable.Address}}</article>
                    <article class="badge badge-success" style="font-size: 1rem">${{bookable.price}} For Each Night</article>
                    <hr/>
                    <article>Created: {{bookable.created_at|fromNow}} </article>
                    <article>Last Updated: {{bookable.updated_at|fromNow}} </article>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h2>Description</h2>
                    <hr>
                    <article>{{bookable.description}}</article>
                    <hr/>
                    <article>
                        <span class="badge badge-primary">The area:{{bookable.area}} m2</span>
                        <span class="badge badge-primary">Number of Rooms:{{bookable.rooms}}</span>
                        <span class="badge badge-primary">The Capacity: {{bookable.capacity}} persons</span>
                        <span class="badge badge-primary">Pool:{{bookable.pool}}</span>
                        <span class="badge badge-primary">Wifi: {{bookable.wifi}}</span>
                    </article>
                </div>
            </div>
            <review-list :bookable-id="this.$route.params.id"/>
        </div>
        <div class="col-md-4 mb-4">
            <availability :bookable-id="this.$route.params.id" v-on:availability="chkPrice" class="mb-4"/>
            <price v-if="price && inBasketAlready" :price="price" class="mb-4">/</price>
            <article v-if="!isLoggedIn && price" class="text-muted text-center">Please Login to go further!</article>
            <button class="btn btn-outline-secondary btn-block" v-if='price && !inBasketAlready && isLoggedIn' @click='addToBasket'>Add to your booking items</button>
            <button class="btn btn-outline-secondary btn-block" v-if='inBasketAlready' @click='removeFromBasket'>Remove from your booking items</button>
            <div v-if="inBasketAlready" class="mt-4 text-muted warning">Seems it has been added to basket</div>
            <div style="margin-top:4rem; width:400px; height:auto; border:1px solid #eee; ">
               <h4 class="p-3 text-uppercase text-secondary font-weight-bold">Host:</h4>
                <span class="p-3 text-uppercase text-secondary font-weight-bold">{{bookable.user.name}}</span>
                <img src="http://localhost:8000/Images/Faces/face3.jpg" style="width:60px; height:60px; border-radius: 100%; margin-left:200px">
                <p class="d-inline-block p-0 mb-0 text-secondary pl-3 ">Being Member {{bookable.user.created_at|fromNow}}</p>
                <p class="d-block p-0 mb-0 text-secondary pl-3 ">Email: {{bookable.user.email}}</p>
                <p class="p-3 text-muted">I am a 34 years old.An engineer from mechanical engineering.I am very passionated about social interaction.</p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <div class="address">
                <img style="width:1100px; height:400px" src="../bookables/Images/Map/map.jpg">
            </div>
        </div>
    </div>
    </div>
</template>

<script>
    import Availability from "../bookables/Availability";
    import ReviewList from "../bookables/ReviewList";
    import Price from '../bookables/Price'
    import {mapState, mapGetters} from 'vuex';
    import moment from 'moment';

    export default {
        components: {
            ReviewList,
            Availability,
            Price
        },
        name: "bookable",
        data() {
            return {
                bookable: '',
                price: null,
            }
        },
        computed: {
            ...mapState({
                lastSearch: 'lastSearch',
                isLoggedIn:'isLoggedIn',
                user:'user'
            }),
                inBasketAlready() {
                    if (this.bookable === null) {
                        return false;
                    }
                    return this.$store.getters.inBasketAlready(this.bookable.id);
                }
        },

        async created() {
            this.bookable=(await (axios.get(`/api/bookables/${this.$route.params.id}`))).data ;
        },

        methods: {
            async chkPrice(event) {
                if (event === false) {
                    this.price = null;
                }
                else {
                    try {
                        this.price = (await (axios.get(`/api/bookables/${this.bookable.id}/price?from=${this.lastSearch.from}&to=${this.lastSearch.to}`))).data.data;
                    }
                    catch (err) {
                        this.price = null;
                    }
                }
            },
            addToBasket() {
                this.$store.dispatch('addToBasket', {
                        bookable: this.bookable,
                        price: this.price,
                        dates: this.lastSearch,
                        user:this.user
                    });
                    },
            removeFromBasket(){
                this.$store.dispatch('removeFromBasket',this.bookable.id)
            },
        },
        filters:{
            fromNow(value){
                return moment(value).fromNow();
            }
        },
    }
</script>

<style scoped>
    .warning {
        font-size: 0.7rem;
    }
</style>