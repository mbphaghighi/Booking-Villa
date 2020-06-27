<template>
    <div>
        <success v-if="success">You successfully advertised your Villa!</success>
        <div v-else>
        <form enctype="multipart/form-data">
            <div class="row">
            <div class="form-group col-md-6">
                <label for="title">Your preferred title</label>
                <input type="text" class="form-control" id="title" placeholder="" v-model="title">
            </div>
            <div class="form-group col-md-6">
                <label for="price">Your preferred price</label>
                <input type="text" class="form-control" id="price" placeholder="" v-model="price">
            </div>
            </div>
            <div class="row">
            <div class="form-group col-md-6">
                <label for="Location">Location</label>
                <select class="form-control" id="Location" v-model="location.selected">
                    <option>Select</option>
                    <option>Adelaide</option>
                    <option>Sydney</option>
                    <option>Melbourne</option>
                    <option>Perth</option>
                    <option>Gold Coast</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="area">Area(m2)</label>
                <input type="text" class="form-control" id="area" placeholder="" v-model="area">
            </div>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <textarea class="form-control" id="address" rows="2" v-model="address"></textarea>
            </div>
            <div class="row">
            <div class="form-group col-md-6">
                <label for="capacity">Capacity</label>
                <select class="form-control" id="capacity" v-model="capacity.selected">
                    <option>Select</option>
                    <option>1~2</option>
                    <option>2~4</option>
                    <option>3~5</option>
                    <option>3~6</option>
                    <option>4~6</option>
                    <option>4~8</option>
                    <option>+8</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="exampleFormControlSelect1">Number of rooms</label>
                <select class="form-control" id="exampleFormControlSelect1" v-model="rooms.selected">
                    <option>Select</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>+4</option>
                </select>
            </div>
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Brief Description</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="description"></textarea>
            </div>
            <div class="form-group">
                <label for="exampleFormControlFile1">Upload the main image</label>
                <input type="file" class="form-control-file" id="exampleFormControlFile1" v-on:change="onFileChange">
            </div>
            <span class="mr-5">Available Facilities</span>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="1" v-model="facilities.wifi">
                <label class="form-check-label" for="inlineCheckbox1">Wifi</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="1" v-model="facilities.pool">
                <label class="form-check-label" for="inlineCheckbox2">Pool</label>
            </div>
        </form>
        <button class="btn btn-primary btn-block mt-3" type="submit" @click.prevent="submit">Submit</button>
        </div>
    </div>
</template>

<script>
    import {mapState, mapGetters} from 'vuex';
    export default {
        name: "advertise",
        data() {
            return {
                location:{
                    selected:null,
                },
                rooms:{
                    selected:null,
                },
                capacity:{
                    selected:null,
                },
                title: null,
                price: null,
                area: null,
                address: null,
                file:null,
                success:false,
                image: null,
                facilities:{
                    pool:null,
                    wifi:null,
                },
                description: null,
            }
        },
                computed:{
                    ...mapState({
                        user: 'user'
                    })
                },
                methods:{
                    onFileChange(e){
                        this.image = e.target.files[0];
                        },

                    async submit(){
                        this.success=false;
                        let formData = new FormData();

                        formData.append('image', this.image);
                        formData.append('title', this.title);
                        formData.append('price', this.price);
                        formData.append('location', this.location.selected);
                        formData.append('area', this.area);
                        formData.append('address', this.address);
                        formData.append('rooms', this.rooms.selected);
                        formData.append('capacity', this.capacity.selected);
                        formData.append('pool', this.facilities.pool);
                        formData.append('wifi', this.facilities.wifi);
                        formData.append('description', this.description);
                        formData.append('user_id', this.user.id);
                        let config = { headers: { 'Content-Type': 'multipart/form-data' } };

                        await axios.post(`/api/bookables`,formData,config).then(response=>{this.success=201===response.status;})
                    }
                }
    }
</script>

<style scoped>

</style>