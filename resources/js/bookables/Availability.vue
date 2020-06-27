<template>
    <div>
        <h6 class="text-uppercase text-secondary font-weight-bold ">check availability</h6>

        <div>
            <transition name="fade">
                <span class="text-danger" v-if="noAvailability">Sorry! It was booked already. </span>
                <span class="text-success" v-if="hasAvailability">Available Now! </span>
            </transition>

        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="from">From:</label>
                <input type="date" name="from" class="form-control form-control-sm" placeholder="Start date" v-model="from" @keyup.enter="check" :class="[{'is-invalid': errorFor('from') }]"/>
                <div class="invalid-feedback" v-for="error in errorFor('from')">{{error}}</div>
            </div>
            <div class="form-group col-md-6">
                <label for="to">To:</label>
                <input type="date" name="to" class="form-control form-control-sm" placeholder="End date" v-model="to" @keyup.enter="check" :class="[{'is-invalid': errorFor('to') }]"/>
                <div class="invalid-feedback" v-for="error in errorFor('to')">{{error}}</div>
            </div>
        </div>
        <button class="btn btn-secondary btn-block" @click="check">
            <span v-if="!loading">Check!</span>
            <span v-if="loading" ><i class="fas fa-circle-notch fa-spin"></i>Checking...</span>
            </button>
    </div>
</template>

<script>
    import {mapState, mapGetters} from 'vuex';
    export default {
        name: "availability",
        props:{
            BookableId:[String,Number]
        },
        data(){
        return {
            from:this.$store.state.lastSearch.from,
            to:this.$store.state.lastSearch.to,
            status:'',
            errors:'',
            loading:false
        }
        },
        methods:{
            check()
            {
                this.errors='';
                this.loading=true;

                this.$store.dispatch('setLastSearch',{
                    from:this.from,
                    to:this.to,
                    userId:this.user.id,
                });
                axios.get(`/api/bookables/${this.BookableId}/availability?from=${this.from}&to=${this.to}`).then(response=>{this.status=response.status; this.$emit('availability', this.hasAvailability )}).catch(error=>{if(error.response.status===422){
                   this.errors=error.response.data.errors;
                }
                this.status=error.response.status; this.$emit('availability', this.hasAvailability )});
                this.loading=false;
            },
            errorFor(field){
                return this.hasErrors && this.errors[field] ? this.errors[field] : null;
            }
        },
        computed:{
            ...mapState({
                user:'user'}),

            hasErrors(){
                return 422===this.status && this.errors!=='';
        },
        hasAvailability (){
                return 200===this.status;
        },
        noAvailability (){
                return 404===this.status;
        }
        }
    }

</script>

<style scoped>
label {
    color:grey;
    font-size: 0.7rem;
    text-transform: uppercase;
    font-weight: bolder;
}
</style>