<?php
namespace app\admin\controller;
use think\View;
use think\Controller;
use app\admin\model\CommidityParent;

class Shop extends Controller
{
	public function index()
	{
		$view = new View();
		return $view -> fetch('index');
	}
}
