<template>
    <div>
        <success v-if="success">You left a review. Thank you!</success>
        <fatal-error v-if="error"/>
        <div class="row" v-if="!success && !error">
        <div :class="[{'col-md-4':!alreadyReviewed},{'d-none': alreadyReviewed}]" v-if="!alreadyReviewed">
            <div class="card">
                <div class="card-body">
                    <div>
                        <p> Stayed at <router-link :to="{name:'bookable',params:{id:booking.bookable.bookable_id}}">{{booking.bookable.title}}</router-link></p>
                        <p>From {{booking.from}} to {{booking.to}}</p>

                    </div>
                </div>
            </div>
        </div>
        <div :class="[{'col-md-8':!alreadyReviewed},{'col-md-12': alreadyReviewed}]">
            <div v-if="alreadyReviewed">
                <h3> You already commented to this item!</h3>
            </div>
            <div v-else>
                <div class="form-group">
                    <label class="text-muted">Select the star rating(1 is worst-5 is best)</label>
                    <star-rating class='rating' v-model="review.rating" />
                    <div class="form-group">
                        <label for="content" class="text-muted">Describe your experience with</label>
                        <textarea name="content" id="content" cols="20" rows="8" class="form-control" v-model="review.content" :class="[{'is-invalid': errorFor('review.content') }]"></textarea>
                        <div class="invalid-feedback" v-for="error in errorFor('review.content')">{{error}}</div>
                    </div>
                </div>
                <button class="btn btn-primary btn-lg" @click.prevent="submit" :disabled="loading">Submit</button>
            </div>
        </div>
        </div>
       </div>
</template>

<script>
    import {mapState, mapGetters} from 'vuex';
    export default {
        name: "review",
        data() {
            return {
                review: {
                    id:'',
                    rating: 5,
                    content: '',
                },
                existingReview: '',
                booking: '',
                loading:false,
                error:false,
                errors:null,
                success:false,
            }
        },
        async created() {

            this.review.id=this.$route.params.id;
            try{
                this.existingReview=(await (axios.get(`/api/reviews/${this.review.id}`))).data.data;
            }
            catch(err){
                if(err.response && err.response.status && err.response.status === 404){
                    try{
                        this.booking=(await (axios.get(`/api/booking-by-review/${this.review.id}`))).data.data;}
                        catch(err){
                        this.error=true;
                        }
                }
                else{
                    this.error=true;
                }
            }
        },
        computed: {
            ...mapState({
                user:'user'
            }),
            alreadyReviewed() {
                return this.hasReview;
            },
            hasReview() {
                return this.existingReview !=='';
            },
            hasBooking() {
                return this.booking;
            }
        },
        methods:{
            submit(){
                this.errors=null;
                this.success=false;

                axios.post(`/api/reviews`,{
                    id:this.review.id,
                    content:this.review.content,
                    rating:this.review.rating,
                    user_name:this.user.name,
                }).then(response=>{this.success=201===response.status;}).catch(err=>{
                    if (err.response && err.response.status && err.response.status === 422){
                        const errors=err.response.data.errors; if(errors['content']){
                            this.errors=errors;
                            return;
                        } }
                this.error=true;}).then(()=>(this.loading=true));
                    },

            errorFor(field){
                return this.errors!==null && this.errors[field] ? this.errors[field] : null;
            }
                }
    }
</script>

<style scoped>
    .rating{
        color:lightseagreen;
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
    }
</style>