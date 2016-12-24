<?php
namespace app\admin\controller;
use think\View;
use think\Controller;
use think\Validate;
use app\admin\model\User;

class Login extends Controller
{
	public function index()
	{
		$view = new View();
		return $view -> fetch('index');
	}

	//用户登录
	public function login()
	{
		$name = input('post.name');
		$password = input('post.password');
		$captcha = input('post.captcha');
		$data = [
			'name' => $name,
			'password' => $password,
			'captcha' => $captcha,
		];
		$rules = [
			'name' => 'require|max:50',
			'password' => 'require|min:6',
			'captcha' => 'require|captcha',
		];
		$validate = $this -> validate($data, $rules);
		// var_dump($validate);
		if ($validate === true) {
			$condition['name'] = $name;
			$condition['password'] = md5($password);
			$user = new User;
			$result = $user -> verifyUserInfo($condition);
			if ($result) {
				$view = new View();
				$view -> assign('name', $result[0]['nickname']);
				return $view -> fetch('shop/shop');
			} else {
				return $this -> error('Login failure,user name or password error!');
			}
		} else {
			$this -> error($validate);
		}
	}

	//验证信息
	public function checkName()
	{
		$user = new User;
		if (! $user -> create()) {
			exit($user -> getError());
		} else {
			echo 0;
		}
	}
}