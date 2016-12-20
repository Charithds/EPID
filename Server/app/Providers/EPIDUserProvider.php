<?php
/**
 * Created by PhpStorm.
 * User: Charith
 * Date: 12/20/2016
 * Time: 1:16 AM
 */

namespace App\Providers;


use App\Role;
use App\User;
use Illuminate\Auth\DatabaseUserProvider;
use Illuminate\Auth\GenericUser;
use Illuminate\Contracts\Hashing\Hasher as HasherContract;
use Illuminate\Contracts\Auth\Authenticatable as UserContract;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class EPIDUserProvider extends DatabaseUserProvider
{
    /**
     * Retrieve a user by their unique identifier.
     *
     * @param  mixed  $identifier
     * @return \Illuminate\Contracts\Auth\Authenticatable|null
     */
    public function retrieveById($identifier)
    {
        // @TODO - handle exception for non users
        $userData = DB::select('select * from users where nic_no =:nic',['nic' => $identifier])[0];

//        $dataAr = [
//            'nic_no' => $userData->nic_no,
//            'email' => $userData->email,
//            'user_type' => $userData->user_type,
//        ];
        $user = new User();
        $user->nic_no = $userData->nic_no;
        $user->email = $userData->email;
        $user->user_type = $userData->user_type;

        $role = new Role();
        $role->name = 'owner';

        $user->attachRole($role);

        return $user;

    }

    /**
     * Retrieve a user by their unique identifier and "remember me" token.
     *
     * @param  mixed  $identifier
     * @param  string  $token
     * @return \Illuminate\Contracts\Auth\Authenticatable|null
     */
    public function retrieveByToken($identifier, $token)
    {
        /*$user = $this->conn->table($this->table)
            ->where('id', $identifier)
            ->where('remember_token', $token)
            ->first();

        return $this->getGenericUser($user);*/
        $userData = DB::select('select * from users where nic_no =:nic and remember_token =:rem_tok',['nic' => $identifier, 'rem_tok' => $token])[0];

        $dataAr = [
            'nic_no' => $userData->nic_no,
            'email' => $userData->email,
            'user_type' => $userData->user_type,
        ];
        $user = new GenericUser($dataAr);

        return $user;
    }

    /**
     * Update the "remember me" token for the given user in storage.
     *
     * @param  \Illuminate\Contracts\Auth\Authenticatable  $user
     * @param  string  $token
     * @return void
     */
    public function updateRememberToken(UserContract $user, $token)
    {
        /*$this->conn->table($this->table)
            ->where('id', $user->getAuthIdentifier())
            ->update(['remember_token' => $token]);*/
        DB::statement('update table users set remember_token=:rem_tok where nic_no=:nic', ['rem_tok' => $token, 'nic' => $user->getAuthIdentifier()]);
    }

    /**
     * Retrieve a user by the given credentials.
     *
     * @param  array  $credentials
     * @return \Illuminate\Contracts\Auth\Authenticatable|null
     */
    public function retrieveByCredentials(array $credentials)
    {
        // First we will add each credential element to the query as a where clause.
        // Then we can execute the query and, if we found a user, return it in a
        // generic "user" object that will be utilized by the Guard instances.
        $query = $this->conn->table($this->table);

        foreach ($credentials as $key => $value) {
            if (! Str::contains($key, 'password')) {
                $query->where($key, $value);
            }
        }

        // Now we are ready to execute the query to see if we have an user matching
        // the given credentials. If not, we will just return nulls and indicate
        // that there are no matching users for these given credential arrays.
        $user = $query->first();

        return $this->getGenericUser($user);
    }

    /**
     * Validate a user against the given credentials.
     *
     * @param  \Illuminate\Contracts\Auth\Authenticatable  $user
     * @param  array  $credentials
     * @return bool
     */
    public function validateCredentials(UserContract $user, array $credentials)
    {
        $plain = $credentials['password'];

        return $this->hasher->check($plain, $user->getAuthPassword());
    }
}