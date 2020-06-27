<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Bookable extends Model
{

    protected $guarded=[];

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function chkAvailability($from, $to)
    {

        $chk = $this->bookings()->betweenDates($from, $to)->count();
        if ($chk == 0) {
            return True;
        } else {
            return false;
        }
    }

    public function priceFor($from, $to)
    {
       $days=(new Carbon($from))->diffInDays(new Carbon($to))+1;
       $price=$days*$this->price;
       return[
           'total'=>$price,
           'breakdown'=>[
               $this->price=>$days
           ]
       ];
    }
}
