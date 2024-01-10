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