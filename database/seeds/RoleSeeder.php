<?php

use App\Models\Role;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles =[
            [
                'name' => 'admin',
                'redirect_to' => '/dash',
            ],
            [
                'name'      => 'member',
                'redirect_to' => '/'
            ],
        ];

        foreach($roles as $role){
            Role::create($role);
        }
    }
}
