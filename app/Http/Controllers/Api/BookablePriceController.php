<?php

namespace App\Http\Controllers\Api;

use App\Bookable;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BookablePriceController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request, Bookable $bookable)
    {
        $data=$request->validate([
            'from'=> 'required|date_format:Y-m-d|after_or_equal:now',
            'to'=>   'required|date_format:Y-m-d|after_or_equal:from',
        ]);
        $days=(new Carbon($data['from']))->diffInDays(new Carbon($data['to']))+1;
        $totalPrice=$days*$bookable->price;
        return response()->json([
            'data'=>[
                'totalPrice'=>$totalPrice,
                'breakDown'=>[
                    $bookable->price =>$days
                ]
            ]
        ]);
    }
}
