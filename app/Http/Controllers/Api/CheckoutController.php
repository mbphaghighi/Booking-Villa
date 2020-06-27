<?php

namespace App\Http\Controllers\Api;

use App\Address;
use App\Bookable;
use App\Booking;
use App\Http\Controllers\Controller;
use App\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class CheckoutController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $data=$request->validate([
            'bookings'=>'required|array|min:1',
            'bookings.*.bookable_id'=>'required|exists:bookables,id',
            'bookings.*.from'=>'required|date|after_or_equal:today',
            'bookings.*.to'=>'required|date|after_or_equal:bookings.*.from',
            'user_id'=>'required|exists:users,id',
            'customer.first_name'=>'required|min:2',
            'customer.last_name'=>'required|min:2',
            'customer.street'=>'required|min:2',
            'customer.phone'=>'required',
            'customer.country'=>'required|min:2',
            'customer.email'=>'required|email',
        ]);

        $data=array_merge($data,$request->validate([
            'bookings.*'=>['required',function($attribute,$value,$fail){
                $bookable=Bookable::findOrFail($value['bookable_id']);
                if(!$bookable->chkAvailability($value['from'],$value['to'])){
                    $fail('The object is not available in given dates.');
                }
            }]
        ]));
        $bookingData=$data['bookings'];
        $addressData=$data['customer'];
        $user=$data['user_id'];

        $bookings=collect($bookingData)->map(function ($bookingData) use ($addressData,$user){
            $booking=new Booking();
            $bookable=Bookable::findOrFail($bookingData['bookable_id']);
            $bookable->increment('booking_count');
            $booking->from=$bookingData['from'];
            $booking->to=$bookingData['to'];
            $booking->user_id=$user;
            $booking->review=$bookingData['review'];
            $booking->price=$bookable->priceFor($booking->from,$booking->to)['total'];
            $booking->bookable()->associate($bookable);
            $booking->address()->associate(Address::create($addressData));
            $booking->save();
            return $booking;
        });
        return $bookings;
    }
}
