<?php
/**
 * Created by PhpStorm.
 * User: Charith
 * Date: 12/18/2016
 * Time: 3:21 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Doctor extends Model
{
    protected $table = 'doctor';
    public $timestamps = false;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'registration_no', 'nic_no', 'full_name', 'hospital_id','contact_no',
    ];

}