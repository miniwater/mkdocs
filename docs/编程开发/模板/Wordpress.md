# Wordpress

## 添加小部件

```php
class Custom_My_Widge extends WP_Widget {

	public function __construct() {
		parent::__construct(
			'custom_widget_id',
			__( '我的小部件', 'my_widget' ),
		);
	}
	
	public function widget( $args, $instance ) {
		// Before widget tag
		echo $args['before_widget'];

    //写你的代码

		// After widget tag
		echo $args['after_widget'];
	}

}

add_action( 'widgets_init', function() {
  // 上面类名
	register_widget( 'Custom_My_Widge' );
});
```

## 添加管理员菜单

```php
//主菜单
function wporg_options_page_html() {
    ?>
    <div class="wrap">
      <h1><?php echo esc_html( get_admin_page_title() ); ?></h1>
      <form action="options.php" method="post">
        <?php
        // output security fields for the registered setting "wporg_options"
        settings_fields( 'wporg_options' );
        // output setting sections and their fields
        // (sections are registered for "wporg", each field is registered to a specific section)
        do_settings_sections( 'wporg' );
        // output save settings button
        submit_button( __( 'Save Settings', 'textdomain' ) );
        ?>
      </form>
    </div>
    <?php
}
add_action('admin_menu', function () {
    add_menu_page(
        'WP Developer',                                 // 页面内标题
        'WP Developer',                                 // 侧边栏名称
        'manage_options',                               // 菜单所需的功能
        'wp_developer_slug',                            // id (slug）
        'wporg_options_page_html',                      // 页面的内容
        plugin_dir_url(__FILE__) . 'images/icon.svg',   // 图标
        20                                              // 菜单顺序中的位置
    );
});

//子菜单
function wporg_options_page_html2() {
	// check user capabilities
	if ( ! current_user_can( 'manage_options' ) ) {
		return;
	}
	?>
	<div class="wrap">
		<h1><?php echo esc_html( get_admin_page_title() ); ?></h1>
		<form action="options.php" method="post">
			<?php
			// output security fields for the registered setting "wporg_options"
			settings_fields( 'wporg_options' );
			// output setting sections and their fields
			// (sections are registered for "wporg", each field is registered to a specific section)
			do_settings_sections( 'wporg' );
			// output save settings button
			submit_button( __( 'Save Settings', 'textdomain' ) );
			?>
		</form>
	</div>
	<?php
}
add_action('admin_menu', function () {
    add_submenu_page(
        'wp_developer_slug',
        '添加',
        '添加页面',
        'manage_options',
        'wp_developer_add_slug',
        'wporg_options_page_html2'
    );
});
```

## 使用第三方smtp邮件服务

```php
function mail_smtp( $phpmailer ) {
    $phpmailer->FromName = '我的网站名'; //发件人名称
    $phpmailer->Host = 'smtp.qq.com'; //修改为你使用的邮箱SMTP服务器
    $phpmailer->Port = 465; //SMTP端口
    $phpmailer->Username = 'xxx@qq.com'; //邮箱账户
    $phpmailer->Password = 'xxx'; //邮箱授权码（此处填写QQ邮箱生成的授权码）
    $phpmailer->From = 'xxx@qq.com'; //邮箱账户
    $phpmailer->SMTPAuth = true;
    $phpmailer->SMTPSecure = 'ssl'; //tls or ssl （port=25时->留空，465时->ssl）
    $phpmailer->IsSMTP();
}
add_action('phpmailer_init', 'mail_smtp');
```

示例：

数据库查询统计

```php
echo sprintf( '本页生成数据库 %d 次查询，耗时 %.3f 秒，使用 %.2fMB 内存',get_num_queries(),timer_stop( 0, 3 ),memory_get_peak_usage() / 1024 / 1024);
```

## 激活 WordPress 维护模式

```php
function wp_maintenance_mode () {  
  if ( ! current_user_can ( 'edit_themes' ) 
               || ! is_user_logged_in ()) {    
    wp_die ( '<h1> Maintenance </h1> <br /> 
      该站点正在定期维护中。
      请稍后再回来查看。'
    ) ;
  }
}
add_action ( 'get_header' , 'wp_maintenance_mode' );
```

## 添加插件

在 `wp-content/plugins/` 创建文件夹，放入同名 `php` 文件。

文件头处放入以下备注：

```php
<?php
/*
Plugin Name: WP Developer
Plugin URI: http://www.example.com
Description: This is my awesome plugin.
Version: 1.0
Author: Example
Author URI: http://www.example.com
Text Domain: wp-fastest-Developer
*/
```

## 自定义登陆页面

```php
<?php
/**
 * 美化Wordpress登录页 By 一为
 * 原文地址：https://www.iowen.cn/chundaimameihuawordpressmorendengluye/
 */
function io_login_header(){
    echo '<div class="login-container">
    <div class="login-body">
        <div class="login-img shadow-lg position-relative flex-fill">
            <div class="img-bg position-absolute">
                <div class="login-info">
                    <h2>'. get_bloginfo('name') .'</h2>
                    <p>'. get_bloginfo('description') .'</p>
                </div>
            </div>
        </div>';
}

function io_login_footer(){
    echo '</div><!--login-body END-->
    </div><!--login-container END-->
    <div class="footer-copyright position-absolute">
            <span>Copyright © <a href="'. esc_url(home_url()) .'" class="text-white-50" title="'. get_bloginfo('name') .'" rel="home">'. get_bloginfo('name') .'</a></span> 
    </div>';
}
add_action('login_header', 'io_login_header');
add_action('login_footer', 'io_login_footer');

   
//登录页面的LOGO链接为首页链接
add_filter('login_headerurl',function() {return esc_url(home_url());});

function custom_login_style(){
	$login_color =['color-l'=>'red','color-r'=>'blue'];
    $ico='/favicon.ico';
    $img='/wp-content/uploads/2024/01/课室低码率.jpg';
    echo '<style type="text/css">
    body{background:'.$login_color['color-l'].';background:-o-linear-gradient(45deg,'.$login_color['color-l'].','.$login_color['color-r'].');background:linear-gradient(45deg,'.$login_color['color-l'].','.$login_color['color-r'].');height:100vh}
    .login h1 a{background-image:url('.$ico.');width:180px;background-position:center center;}
    .login-container{position:relative;display:flex;align-items:center;justify-content:center;height:100vh}
    .login-body{position:relative;display:flex;margin:0 1.5rem}
    .login-img{display:none}
    .img-bg{color:#fff;padding:2rem;bottom:-2rem;left:0;top:-2rem;right:0;border-radius:10px;background-image:url('.$img.');background-repeat:no-repeat;background-position:center center;background-size:cover}
    .img-bg h2{font-size:2rem;margin-bottom:1.25rem}
    #login{position:relative;background:#fff;border-radius:10px;padding:28px;width:280px;box-shadow:0 1rem 3rem rgba(0,0,0,.175)}
    .flex-fill{flex:1 1 auto}
    .position-relative{position:relative}
    .position-absolute{position:absolute}
    .shadow-lg{box-shadow:0 1rem 3rem rgba(0,0,0,.175)!important}
    .footer-copyright{bottom:0;color:rgba(255,255,255,.6);text-align:center;margin:20px;left:0;right:0}
    .footer-copyright a{color:rgba(255,255,255,.6);text-decoration:none}
    #login form{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;border-width:0;padding:0}
    #login form .forgetmenot{float:none}
    .login #login_error,.login .message,.login .success{border-left-color:#40b9f1;box-shadow:none;background:#d4eeff;border-radius:6px;color:#2e73b7}
    .login #login_error{border-left-color:#f1404b;background:#ffd4d6;color:#b72e37}
    #login form p.submit{padding:20px 0 0}
    #login form p.submit .button-primary{float:none;background-color:#f1404b;font-weight:bold;color:#fff;width:100%;height:40px;border-width:0;text-shadow:none!important;border-color:none;transition:.5s}
    #login form input{box-shadow:none!important;outline:none!important}
    #login form p.submit .button-primary:hover{background-color:#444}
    .login #backtoblog,.login #nav{padding:0}
    @media screen and (min-width:768px){.login-body{width:1200px}
    .login-img{display:block}
    #login{margin-left:-60px;padding:40px}
    }
</style>';
}
add_action('login_head', 'custom_login_style');

//关闭多语言切换按钮
add_filter( 'login_display_language_dropdown', '__return_false' );
```
