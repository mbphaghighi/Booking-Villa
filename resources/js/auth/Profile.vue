<template>
    <div class="row">
        <div class="col-md-7">
            <h4 class="mb-4">Personal Details</h4>
            <div class="form-row">
                <div class="col-md-6 form-group">
                    <label for="name">First Name</label>
                    <input id="name" type="text" class="form-control" name="first_name" :value="user.name"
                           :class="[{'is-invalid': errorFor('first_name') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('first_name')">{{error}}</div>
                </div>
                <div class="col-md-6 form-group">
                    <label for="lastname">Last Name</label>
                    <input id="lastname" type="text" class="form-control" :value="user.name"
                           :class="[{'is-invalid': errorFor('last_name') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('last_name')">{{error}}</div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 form-group">
                    <label for="email">Email</label>
                    <input id="email" type="text" class="form-control" :value="user.email"
                           :class="[{'is-invalid': errorFor('email') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('email')">{{error}}</div>
                </div>
                <div class="col-md-6 form-group">
                    <label for="tel">Phone</label>
                    <input id="tel" type="text" class="form-control":value="user.phone"
                           :class="[{'is-invalid': errorFor('phone') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('phone')">{{error}}</div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 form-group">
                    <label for="city">City</label>
                    <input id="city" type="text" class="form-control" v-model="city"
                           :class="[{'is-invalid': errorFor('city') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('city')">{{error}}</div>
                </div>

                <div class="col-md-6 form-group">
                    <label for="street">Street</label>
                    <input id="street" type="text" class="form-control" v-model="street"
                           :class="[{'is-invalid': errorFor('street') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('street')">{{error}}</div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 form-group">
                    <label for="country">Country</label>
                    <input id="country" type="text" class="form-control" v-model="country"
                           :class="[{'is-invalid': errorFor('country') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('country')">{{error}}</div>
                </div>
                <div class="col-md-4 form-group">
                    <label for="state">State</label>
                    <input id="state" type="text" class="form-control" v-model="state"
                           :class="[{'is-invalid': errorFor('state') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('state')">{{error}}</div>
                </div>
                <div class="col-md-2 form-group">
                    <label for="zip">Zip</label>
                    <input id="zip" type="text" class="form-control" v-model="zip"
                           :class="[{'is-invalid': errorFor('zip') }]"/>
                    <div class="invalid-feedback" v-for="error in errorFor('zip')">{{error}}</div>
                </div>
            </div>
            <hr/>
            <button type="submit" class="btn btn-success btn-block" @click.prevent="saveProfile">Submit</button>
        </div>
        <div class="col-md-5">
            <div class="d-flex justify-content-between">
                <h6 class="text-uppercase text-secondary font-weight-bolder">Your booking experience</h6>
            </div>

                <div v-for="booking in booking" >
                    <div class="pt-2 pb-2 border-top d-flex justify-content-between">
                        <span>
                            <router-link
                                    :to="{name:'bookable', params:{id:booking.bookable.id}}">{{booking.bookable.title}}</router-link>
                            </span>
                        <span>{{booking.bookable.Location}}</span>
                    </div>
                    <div class="pt-2 pb-2 d-flex justify-content-between">
                        <span>
                            From: {{booking.from}}
                        </span>

                        <span>
                            To: {{booking.to}}
                        </span>
                        <h6 >

                            <router-link :to="{name:'review',params:{id:booking.review}}">Rate it!</router-link>
                        </h6>
                    </div>

                </div>
        </div>
    </div>

</template>

<script>
    import {mapState, mapGetters} from 'vuex';

    export default {
        name: "profile",

        computed: {
            ...mapState({
                user: 'user'
            }),

        },

        data() {
            return {
                customer:null,
                first_name: null,
                last_name: null,
                email: null,
                phone: null,
                country: null,
                city: null,
                street: null,
                state: null,
                zip: null,
                errors: null,
                booking:'',
            }
        },
        methods: {
            async saveProfile() {
                try {
                    await axios.post(`/api/profile`, {
                        user_id: this.user.id,
                        first_name: this.first_name,
                        last_name: this.last_name,
                        email: this.email,
                        phone: this.phone,
                        country: this.country,
                        street: this.street,
                        state: this.state,
                        city: this.city,
                        zip: this.zip,
                    })
                }
                catch (error) {
                    this.errors = error.response && error.response.data.errors;
                }
            },
            errorFor(field) {
                return this.errors !== null && this.errors[field] ? this.errors[field] : null;
            },
        },
         async created(){
           // this.customer=(await (axios.get(`/api/profile/${this.user.id}`))).data;
             this.booking=(await (axios.get(`/api/booking-experience/${this.user.id}`))).data;
        }
    }
</script>

<style scoped>

</style>