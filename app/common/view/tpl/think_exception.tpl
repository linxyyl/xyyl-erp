<html>
<title>系统错误</title>
</html>

<?php
if (env('app.debug')) {
    echo "<h3>错误信息: {$message}</h3>";
    echo "<h3>错误文件: {$file} {$line} 行</h3>";
    echo '<p>错误代码块</p>';
    echo "<div style='background: #0a4b3e;color: #ff3333'>";
    foreach ($source['source'] as $v) {
        echo "<p> {$v} </p>";
    }
    echo "</div>";
    exit;
} else {
    echo '<body><h1>404 Not Found</h1><p>未知错误</p></body>';
    exit;
}



