<?php

namespace App\Http\Controllers\Api;

use App\Bookable;
use App\Booking;
use App\Http\Controllers\Controller;
use App\Http\Resources\ReviewResource;
use App\Review;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    public function show(Review $review){
        return new ReviewResource($review);
    }

    public function store(Request $request){
        $data=$request->validate([
            'id'=> 'required|unique:reviews',
            'content'=>'required',
            'rating'=>'required|in:1,2,3,4,5',
            'user_name'=>'required',
        ]);

        $booking=Booking::where('review',$data['id'])->get()->first();
        if($booking===null){
            return abort(404);
        }
        $booking->review_id=0;
        $booking->save;
        $bookable=Bookable::where('id',$booking->bookable_id);
        $bookable->increment('review_count');

        $review=Review::make($data);
        $review->booking_id=$booking->id;
        $review->user_name=$data['user_name'];
        $review->bookable_id=$booking->bookable_id;
        $review->save();
        return $review;

    }
}
