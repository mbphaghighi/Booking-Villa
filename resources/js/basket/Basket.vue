<template>
    <div>
        <success v-if="success">Congratulation, You have successfully booked the villa!</success>
        <div class="row" v-else>
            <div class="col-md-8" v-if="itemsInBasket">
                <h4 class="mb-4">Personal Details</h4>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <label for="name">First Name</label>
                        <input id="name" type="text" class="form-control"  name="first_name" v-model="customer.first_name" :class="[{'is-invalid': errorFor('customer.first_name') }]"/>
                        <div class="invalid-feedback" v-for="error in errorFor('customer.first_name')">{{error}}</div>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="lastname" >Last Name</label>
                        <input id="lastname" type="text" class="form-control"  v-model="customer.last_name" :class="[{'is-invalid': errorFor('customer.last_name') }]"/>
                        <div class="invalid-feedback" v-for="error in errorFor('customer.last_name')">{{error}}</div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <label for="email">Email</label>
                        <input id="email" type="text" class="form-control" v-model="customer.email" :class="[{'is-invalid': errorFor('customer.email') }]"/>
                        <div class="invalid-feedback" v-for="error in errorFor('customer.email')">{{error}}</div>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="tel">Phone</label>
                        <input id="tel" type="text" class="form-control" v-model="customer.phone" :class="[{'is-invalid': errorFor('customer.phone') }]"/>
                        <div class="invalid-feedback" v-for="error in errorFor('customer.phone')">{{error}}</div>
                    </div>
            </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <label for="city">City</label>
                        <input id="city" type="text" class="form-control" v-model="customer.city" :class="[{'is-invalid': errorFor('customer.city') }]"/>
                        <div class="invalid-feedback" v-for="error in errorFor('customer.city')">{{error}}</div>
                    </div>

                    <div class="col-md-6 form-group">
                        <label for="street">Street</label>
                        <input id="street" type="text" class="form-control" v-model="customer.street" :class="[{'is-invalid': errorFor('customer.street') }]"/>
                        <div class="invalid-feedback" v-for="error in errorFor('customer.street')">{{error}}</div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <label for="country">Country</label>
                        <input id="country" type="text" class="form-control" v-model="customer.country" :class="[{'is-invalid': errorFor('customer.country') }]"/>
                        <div class="invalid-feedback" v-for="error in errorFor('customer.country')">{{error}}</div>
                    </div>
                   <div class="col-md-4 form-group">
                    <label for="state">State</label>
                    <input id="state" type="text" class="form-control" v-model="customer.state" :class="[{'is-invalid': errorFor('customer.state') }]"/>
                       <div class="invalid-feedback" v-for="error in errorFor('customer.state')">{{error}}</div>
                </div>
                <div class="col-md-2 form-group">
                <label for="zip">Zip</label>
                <input id="zip" type="text" class="form-control" v-model="customer.zip" :class="[{'is-invalid': errorFor('customer.zip') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('customer.zip')">{{error}}</div>
            </div>
                </div>
                <hr/>
                <h4 class="mb-4">Pay Details</h4>
                <div class="form-row">
                    <div class="col-md-12 form-group">
                        <label for="cardname">Card Name</label>
                        <input id="cardname" type="text" class="form-control" name="first_name"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 form-group">
                        <label for="cardnumber" >Card Number</label>
                        <input id="cardnumber" type="text" class="form-control" />
                    </div>
                    <div class="col-md-3 form-group">
                        <label for="expireyear" >Expire year</label>
                        <input id="expireyear" type="text" class="form-control" />
                    </div>
                    <div class="col-md-3 form-group">
                        <label for="expriremonth" >Expire Month</label>
                        <input id="expriremonth" type="text" class="form-control" />
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-12 form-group">
                        <button type="submit" class="btn btn-success btn-block" @click.prevent="book">Pay now! </button>
                    </div>
                </div>
            </div>
            <div class="col-md-8" v-else>
                <div class="jumbotron jumbotron-fluid text-center">
                    <h1>Empty</h1>
                </div>
            </div>
            <div class="col-md-4">
                <div class="d-flex justify-content-between">
                    <h6 class="text-uppercase text-secondary font-weight-bolder">Your cart</h6>
                    <h6 >
                        <span v-if="itemsInBasket">{{itemsInBasket}} Items</span>
                        <router-link :to="{name:'home'}" v-else >Add Item</router-link>
                    </h6>
                </div>
                <transition-group name="fade">
                    <div v-for="item in basket" :key="item.bookable.id">
                        <div class="pt-2 pb-2 border-top d-flex justify-content-between">
                        <span>
                            <router-link
                                    :to="{name:'bookable', params:{id:item.bookable.id}}">{{item.bookable.title}}</router-link>
                            </span>

                            <span class="font-weight-bold">
                            ${{item.price.totalPrice}}
                        </span>
                        </div>
                        <div class="pt-2 pb-2 d-flex justify-content-between">
                        <span>
                            From: {{item.dates.from}}
                        </span>

                            <span>
                            To: {{item.dates.to}}
                        </span>
                        </div>
                        <div class="pt-2 pb-2 text-right">
                            <button class="btn btn-sm btn-outline-secondary" @click="$store.dispatch('removeFromBasket',item.bookable.id)" :disabled="loading">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </div>
                </transition-group>

            </div>
        </div>
    </div>
</template>

<script>
    import {mapState, mapGetters} from 'vuex';

    export default {
        name: "basket",
        data(){
            return{
                loading:false,
                errors:null,
                bookingAttempted:false,
                customer:{
                    first_name:null,
                    last_name:null,
                    email:null,
                    phone:null,
                    country:null,
                    street:null,
                   state:null,
                   zip:null,
                },
            }
        },
        computed: {
            ...mapGetters(['itemsInBasket']),
            ...mapState({
                basket: state => state.basket.items,
                user:'user'
            }),
            success(){
                return !this.loading && this.itemsInBasket===0 && this.bookingAttempted;
            }
        },
        methods:{
            async book(){
                this.loading=true;
                this.errors=null;
                this.bookingAttempted=false;
                try{
                    await axios.post(`/api/checkout`,{
                        customer:this.customer,
                        user_id:this.user.id,
                        bookings:this.basket.map(basketItem=>({
                        bookable_id:basketItem.bookable.id,
                            from:basketItem.dates.from,
                                to:basketItem.dates.to,
                            review:Math.random()*1000000,
                        }))});
                        this.$store.dispatch('clearBasket');
                }
                catch(error){
                    this.errors=error.response && error.response.data.errors;
                }
                this.loading=false;
                this.bookingAttempted=true;
            },
            errorFor(field){
                return this.errors!==null && this.errors[field] ? this.errors[field] : null;
            }
        }
    }
</script>

<style scoped>
    h6 .badge {
        font-size: 100%;
    }
</style>