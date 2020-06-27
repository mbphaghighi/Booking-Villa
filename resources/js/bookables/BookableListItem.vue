<template>
    <div class="card mb-2 w-200">
        <router-link :to="{name: 'bookable',params: {id}}">
            <img class="card-image-top" :src="`http://localhost:8000/upload/${id}.jpg`">
        </router-link>

        <div class="card-body  pl-0 pr-0">
            <router-link :to="{name: 'bookable',params: {id}}">
                <h4 class="card-title ml-2" >{{title}}</h4>
            </router-link>

            <i class="fas fa-map-marker-alt ml-2"></i>
            <h6 class="card-subtitle mb-2 ml-2 mr-5 text-muted" style="display: inline">{{Location}}</h6>
            <span class="badge badge-primary ml-3">{{created_at|fromNow}}</span>
            <div class="mt-3">

                <p class="card-text ml-2" style="display: inline">${{price}} Nightly</p>
                <i class="far fa-heart fa-2x ml-5" :data-count="`${this.booking_count}`"></i>
                <i class="fas fa-comment-alt fa-stack-2 ml-4" style="font-size: 1.5rem;" :data-count="`${this.review_count}`" ></i>
            </div>
        </div>
        <div class="card-footer pl-0 pr-0">
            <span class="text-muted mb-0 mr-2 ml-1">Area:{{area}}m2</span>
            <span class="text-muted mb-0 mr-2">Rooms:{{rooms}}</span>
            <span class="text-muted mb-0">Capacity:{{capacity}}</span>
        </div>
    </div>

</template>

<script>
    import moment from 'moment';
    export default {
        name: "bookable-list-item",
        data(){
            return{
                count:0
            }
        },
        props: {
            title: String,
            description: String,
            price: Number,
            Location: String,
            image: String,
            id: Number,
            area: Number,
            rooms: Number,
            capacity: String,
            Address: String,
            created_at: String,
            updated_at: String,
            review_count:Number,
            booking_count:Number,
        },
        filters: {
            fromNow(value) {
                return moment(value).fromNow();
            }
        },
    }
</script>

<style scoped>
    .fas[data-count]{
        position:relative;
    }
    .fas[data-count]:after{
        position: absolute;
        right: -0.75em;
        top: -.75em;
        content: attr(data-count);
        padding: .5em;
        border-radius: 10em;
        line-height: .9em;
        color: white;
        background: rgba(255,0,0,.75);
        text-align: center;
        min-width: 2em;
        font: bold .4em sans-serif;
    }
    .far[data-count]{
        position:relative;
    }
    .far[data-count]:after{
        position: absolute;
        right: -0.75em;
        top: -.75em;
        content: attr(data-count);
        padding: .5em;
        border-radius: 10em;
        line-height: .9em;
        color: white;
        background: rgba(255,0,0,.75);
        text-align: center;
        min-width: 2em;
        font: bold .4em sans-serif;
    }
</style>