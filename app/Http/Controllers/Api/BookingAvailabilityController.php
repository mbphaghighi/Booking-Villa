<?php

namespace App\Http\Controllers\Api;

use App\Bookable;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BookingAvailabilityController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request,Bookable $bookable)
    {
        $data=$request->validate([
            'from'=> 'required|date_format:Y-m-d|after_or_equal:now',
            'to'=>   'required|date_format:Y-m-d|after_or_equal:from',
        ]);
        $from=$request->from;
        $to=$request->to;

        return $bookable->chkAvailability ($from, $to)
            ? response()->json([])
            : response()->json([],404);
    }
}
