<?php

namespace sms;

use app\common\model\Sms;

/**
 * 互亿无线短信发送
 * Class Huyi
 * @package sms
 */
class Huyi
{

    /**
     * 发送短信 成功返回true 失败返回false
     * @param $phone
     * @return int
     */
    public static function sms($phone)
    {
        $code = substr(str_shuffle('1234567890'), 0, 6);
        $url = 'http://106.ihuyi.com/webservice/sms.php?method=Submit';
        $action = '';
        $password = '';
        $data = "account={$action}&password={$password}&mobile={$phone}&content=" . rawurlencode("您的验证码是：{$code} 。请不要把验证码泄露给其他人。");
        $gets = static::xml_to_array(static::curlPost($url, $data));
        if ($gets['SubmitResult']['code'] == 2) {
            // 发送成功 记录信息
            Sms::record($phone, $code);
            return true;
        } else {
            return false;
        }
    }

    /**
     * curl请求指定url (post)
     * @param $url
     * @param array $data
     * @return mixed
     */
    public static function curlPost($url, $data = [])
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    /**
     * 将xml转php 数组
     * @param $xml
     * @return mixed
     */
    public static function xml_to_array($xml)
    {
        $reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
        if (preg_match_all($reg, $xml, $matches)) {
            $count = count($matches[0]);
            for ($i = 0; $i < $count; $i++) {
                $subxml = $matches[2][$i];
                $key = $matches[1][$i];
                if (preg_match($reg, $subxml)) {
                    $arr[$key] = xml_to_array($subxml);
                } else {
                    $arr[$key] = $subxml;
                }
            }
        }
        return $arr;
    }

}