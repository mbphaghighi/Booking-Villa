<template>
    <div style="padding:1.25rem;">
        <h6 class="text-uppercase text-secondary font-weight-bolder pt-4">Review List</h6>
        <div class="border-bottom d-none d-md-block" v-for="review in reviews">
            <div class="row pt-4">
                <div class="col-md-6">{{review.user_name}}</div>
                <div class="col-md-6 d-flex justify-content-end">
                <star-rating :value="review.rating"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-muted">{{review.created_at|fromNow}}</div>
            </div>
            <div class="row pt-4 pb-4">
                <div class="col-md-12">{{review.content}}</div>
            </div>
        </div>
    </div>
</template>

<script>
    import moment from 'moment';
    import {mapState, mapGetters} from 'vuex';
    export default {
        name: "review-list",
        props:{
            BookableId:[String,Number],
        },
        data(){
            return{
                reviews:'',
            }
        },
        created(){
            axios.get(`/api/bookables/${this.BookableId}/reviews`).then(response=>this.reviews=response.data[0]);

        },
        filters:{
            fromNow(value){
                return moment(value).fromNow();
            }
        },
        computed:{
            ...mapState({
                user:'user'
            }),
        }
    }
</script>

<style scoped>

</style>