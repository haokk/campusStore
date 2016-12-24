<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class User extends Model
{
	const TB_USER = 'user';
	protected $pk = 'id';

	//验证登录信息
	public function verifyUserInfo($codition)
	{
		return Db::table(self::TB_USER) -> where($codition) -> select();
	}
}