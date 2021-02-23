<?php

namespace app\common\middleware;

/**
 * 请求统计
 * Class RequestStatistics
 * @package app\common\middleware
 */
class RequestStatistics
{
    public function handle($request, \Closure $next)
    {
        return $next($request);
    }


}