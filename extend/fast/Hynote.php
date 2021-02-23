<?php

namespace fast;

/**
 * 互亿无线短信发送
 * Class Hynote
 * @package fast
 */
class Hynote
{

    /**
     * 发送短信
     * @param $phone string 电话号码
     * @param $content string 验证码
     * @return array
     */
    public static function sms($phone)
    {
        // 发送6位数字验证码
        $content = substr(str_shuffle('1234567890'), 0, 6);

        $url = 'http://106.ihuyi.com/webservice/sms.php?method=Submit';
        $action = 'C74891343';
        $password = 'c3baef3a128bbbad74cfef37348da077';
        $data = "account={$action}&password={$password}&mobile={$phone}&content=" . rawurlencode("您的验证码是：{$content} 。请不要把验证码泄露给其他人。");
        $gets = xml_to_array(static::curlPost($url, $data));
        if ($gets['SubmitResult']['code'] == 2) {
            // 发送成功 记录信息
            //SlsjSms::setInfo($phone, $content);
            return 1;
        } else {
            return 0;
        }
    }

    /**
     * curl请求指定url (post)
     * @param $url
     * @param array $data
     * @return mixed
     */
    private static function curlPost($url, $data = [])
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


}