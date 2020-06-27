<template>
    <div v-if="loading">
        Loading the Page...
    </div>
    <div class="container" v-else>
        <div class="row">
            <div class="form-group col-md-3">
                <label for="location">Search By Location</label>
                <select class="form-control" id="location" v-model="location.selected" @change='SearchChange'>
                    <option>All</option>
                    <option>Adelaide</option>
                    <option>Sydney</option>
                    <option>Melbourne</option>
                    <option>Perth</option>
                    <option>Gold Coast</option>
                </select>
            </div>
            <div class="form-group col-md-3">
                <label for="price">Search By Price</label>
                <select class="form-control" id="price" v-model="price.selected" @change='SearchChange'>
                    <option>All</option>
                    <option>0$-$200</option>
                    <option>$200-$400</option>
                    <option>$400-$600</option>
                    <option>$600-$1000</option>
                    <option>$1000-$2000</option>
                </select>
            </div>
            <div class="form-group col-md-3">
                <label for="rooms">Search By Number of Rooms</label>
                <select class="form-control" id="rooms" v-model="room.selected" @change='SearchChange' >
                    <option>All</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="form-group col-md-3">
                <label for="order">Sort By </label>
                <select class="form-control" id="order" v-model="order.selected" @change='orderChange' >
                    <option>Newest</option>
                    <option>Cheapest</option>
                    <option>Commented</option>
                    <option>Popular</option>
                </select>
            </div>
        </div>
        <div class="row mt-2" v-for="(row,index) in rows" :key="index">
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12" v-for="bookable in bookablesInRow(row)" >
                <bookable-list-item v-bind="bookable"/>
            </div>
        </div>
    </div>

</template>

<script>
    import BookableListItem from "./BookableListItem";

    export default {
        name: "bookables",
        data(){
            return {
                bookables:'',
                loading:false,
                columns:3,
                order:{
                    selected:"Newest",
                },
                location:{
                    selected:"All",
                },
                room:{
                    selected:"All",
                },
                price:{
                    selected:"All",
                }
            }
        },
        created(){
            this.loading=true;
            const request= axios.get('/api/bookables').then(response=>{
                this.bookables=response.data;
                this.loading=false;
            });
        },
        computed:{
            rows(){
                return this.bookables===null ?0 :Math.ceil(this.bookables.length/this.columns);
            }
        },
        methods:{
            bookablesInRow(row){
                return this.bookables.slice((row-1)*this.columns,row*this.columns)
            },

            async orderChange(event){
                this.bookables=(await (axios.get(`/api/bookables?${this.order.selected}=1`))).data;
            },

            async SearchChange(event){

                this.bookables=(await (axios.get(`/api/bookables?location=${this.location.selected}&room=${this.room.selected}&price=${this.price.selected}`))).data;
            },

        },
        components: {BookableListItem},
    }
</script>

<style scoped>

</style>