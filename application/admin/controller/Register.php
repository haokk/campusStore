<?php
namespace app\admin\controller;
use think\View;
use think\Controller;
use app\admin\model\User;

class Register extends Controller
{
	public function index()
	{
		$view = new View();
		return $view -> fetch('index');
	}

	//用户注册
	public function register()
	{
		$user = new User;
	}
}