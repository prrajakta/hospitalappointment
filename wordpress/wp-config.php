<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'hospital online booking' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', '' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'C@Z-fq-)?Bwvg=>&z[8 $GZcBpC24tzw<~Ux.:QhZ15nDRz>5N.:oqjG<3/hLz|v' );
define( 'SECURE_AUTH_KEY',  'Ku$=]zO%8SyF grZMV1v7?]33Epl@JSo5wKNxw+vk9>,6@}uq#[[puDq+h/N~4].' );
define( 'LOGGED_IN_KEY',    '.Ck(Zvuef1XBl8xqq~w1<?Z)BqT%W2Yb[N%yC)eJt/V.A_Z_-IkOMV%t`c}/;D4=' );
define( 'NONCE_KEY',        'X*[C8_QK4i)OSa{(n9inX]Q9Rs;9dVFq>nAm}DpTcuh{0X$?:XOD9#N#rh.LN+i?' );
define( 'AUTH_SALT',        '^j(|u#TKTQ#YHDg9htBJ2/H{ns_Jv{S1i5_)UnI43Y(<=S V;8.~l2@tjto~hS?}' );
define( 'SECURE_AUTH_SALT', 'aEi0!QYAsN0l^I+;6C)yUZ)v]u=>m+wqQ,l0)_45D{C6@[c=R6t+V)v%G_~6rLMg' );
define( 'LOGGED_IN_SALT',   'R65_vVxqt*EGgIDAVbP([&RsuKjL]4O9[np/`xaih]=_axIcd!qk{?R51n4E50dg' );
define( 'NONCE_SALT',       '4#4Ry@QM+G!<J]%D@#IlP -7H_Rnxp&kdk59[aGY.NPMht.>zF1HKINo}iTa07d2' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
