<?php

namespace App\Http\Controllers\Api;

use App\Bookable;
use App\Booking;
use App\Http\Controllers\Controller;
use App\Http\Resources\BookingWithReviewResource;
use Illuminate\Http\Request;

class BookingByReviewController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke( Request $request,$key )
    {
        $bookable=Booking::where('review',$key)->with('bookable')->get()->first();
        return $bookable ? new BookingWithReviewResource($bookable) : abort(404);
    }
}
