<?php

namespace App\Http\Controllers\Api;

use App\Bookable;
use App\Booking;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BookableController extends Controller
{
   public function index()
   {

       $bookable = Bookable::query()->orderBy('created_at', 'desc');

       $popular = request('Popular');
       $newest = request('Newest');
       $reviews = request('Commented');
       $price = request('Cheapest');
       $location = request('location');
       $priceSearch = request('price');
       $room = request('room');

       if ($room === 'All' && $priceSearch === 'All' && $location === 'All') {
           $bookable = $bookable->orderBy('created_at', 'desc');
       } elseif ($popular) {
           $bookable= Bookable::query()->orderBy('booking_count', 'desc');
       } elseif ($newest) {
           $bookable = Bookable::query()->orderBy('created_at', 'desc');
       } elseif ($reviews) {
           $bookable = Bookable::query()->orderBy('review_count', 'desc');
       } elseif ($price) {
           $bookable = Bookable::query()->orderBy('price', 'asc');
       } elseif ($location & $room & $priceSearch) {
           if ($priceSearch !== 'All') {
               $array = explode('-', $priceSearch);
               $price1 = ltrim($array[0], "$");
               $price2 = ltrim($array[1], "$");
           }

           if ($location === 'All') {
               if ($room === "All" && $priceSearch !== 'All') {
                   $bookable = $bookable->whereBetween('price', [$price1, $price2]);
               } elseif ($room !== 'All' && $priceSearch !== 'All') {
                   $bookable = $bookable->where('rooms', $room)->whereBetween('price', [$price1, $price2]);
               } else {
                   $bookable = $bookable->where('rooms', $room);
               }
           } elseif ($room === 'All') {
               if ($location === 'All' && $priceSearch !== 'All') {
                   $bookable = $bookable->whereBetween('price', [$price1, $price2]);
               } elseif ($location !== 'All' && $priceSearch !== 'All') {
                   $bookable = $bookable->where('location', $location)->whereBetween('price', [$price1, $price2]);
               } else {
                   $bookable = $bookable->where('location', $location);
               }
           } elseif ($priceSearch === 'All') {
               if ($location !== 'All' && $room === 'All') {
                   $bookable = $bookable->where('location', $location);
               } elseif ($location === 'All' && $room !== 'All') {
                   $bookable = $bookable->where('rooms', $room);
               } else {
                   $bookable = $bookable->where('location', $location)->where('rooms', $room)->whereBetween('price', [$price1, $price2]);
               }

           }
           elseif ($location!=="All" && $room!=='All' && $priceSearch!=='All'){
               $bookable = $bookable->where('location', $location)->where('rooms', $room)->whereBetween('price', [$price1, $price2]);
           }

       }
       $bookable = $bookable->get();
       return $bookable;

   }

   public function show($id){
       $bookable=Bookable::where('id',$id)->with('user')->get()->first();
       return $bookable;
   }

   public function store(Request $request){

       $request->validate([
           'user_id' => 'required|exists:users,id',
           'title' => 'required|min:2',
           'location' => 'required',
           'description' => 'required|min:2',
           'area' => 'required',
           'rooms' => 'required',
           'capacity' => 'required',
           'address' => 'required|min:2',
           'price' => 'required',

           ]);
       if($request['pool']==='true'){
           $request['pool']="Yes";
       }
       else{
           $request['pool']="No";
       }
       if($request['wifi']==='true'){
           $request['wifi']="Yes";
       }
       else{
           $request['wifi']="No";
       }

       $image = $request['image'];

       $extension = $image->getClientOriginalExtension();



       $host=Bookable::create($request->all());
       $bookable=Bookable::orderBy('id','desc')->first();

       $fileName = $bookable->id.'.'.$extension;

       $request->image->move(public_path('upload'), $fileName);


       return $host;
   }


}
