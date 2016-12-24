<?php
namespace app\admin\validate;
use think\Validate;

class User extends Validate
{
	protected $rule = [
		'name' => 'require|max:25',
		'password' => 'require|min:6',
	];
}