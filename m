From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Fwd: [PATCH] configure: use AC_MSG_NOTICE rather than `echo`
Date: Thu, 11 Oct 2012 11:54:35 -0400
Message-ID: <5076EBBB.6090109@suse.com>
References: <1232209551-5088-1-git-send-email-vapier@gentoo.org> <507595F2.6060009@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <507595F2.6060009@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/10/12 11:36 AM, Edward Shishkin wrote:
> 
> 
> 
> -------- Original Message -------- Subject: 	[PATCH] configure: use
> AC_MSG_NOTICE rather than `echo` Date: 	Sat, 17 Jan 2009 11:25:51
> -0500 From: 	Mike Frysinger <vapier@gentoo.org> To:
> reiserfs-devel@vger.kernel.org
> 
> 
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org> --- configure.in
> |    5 +++-- 1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/configure.in b/configure.in index a3cc867..dd3e353
> 100644 --- a/configure.in +++ b/configure.in @@ -193,5 +193,6 @@
> AC_OUTPUT( debugreiserfs/Makefile tune/Makefile)
> 
> -echo -echo Type \'make\' to compile reiserfsprogs 
> +AC_MSG_NOTICE([ + +Type 'make' to compile reiserfsprogs]) -- 
> 1.6.1

Applied.

- -Jeff


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQduu6AAoJEB57S2MheeWylXIP/j6F8q7/CBQhUEqAsyz8lz+7
pa7rUHjAgJPPmBznWkcYtL4yykHhunz9l6wL0GZ+F2DOJksQrYGeuqwVGSF9qPQY
5HwZSSdWwOHdeFb9D/FbpPDHIMqiG9Pv23sN1E/XvNwtxOrEr6U+c4AnGSfQTXsJ
+PHiniGcT9+3g2uJDq25Xm1RPuHtPNJcGuOsbEBQgloQBgrbL9VnMPWGuWs7vaAX
4qCieI3pYCJcXxcll/gKYVxMnzIRz0szl12fHgZRvzUiOOC9DmZZlSV15ECn4xAS
BqtYU4WIDJGjZBKezSnY8vnJbKIo2pZuVXkxYlaGGodX3mBrxUU6sgf8hNuqj8Gm
kwu+wluE1mR+sKKkDwj7yQ4UC/tSp6ukXTUyRN0iNSLLQH+WB7qY+qvFsl/VjJ0p
1yCrQOWF5Jt/pSOlZc05yMQr/KgoOu3Z73us18jO/slvLi8ukShN3G5NUvSb+kU0
2R5xLPNU7u6eLxJ9C8x8NzUKxiG4FfwNiB3K+BcUlhuVo48Y4+ry4X/Lm0NDwyNe
LbU4OZrmCUHjGYPHCpxkQgF0EEg60QU9V1JrN4tT0fksPBwEhgwI1hjO+hsSJMNC
5BpQ6/bW1D/FDz26XHs9OPiezHdg399ovZ0ZF+qBnZrICwfUtzki52ZI7Joi8S8N
b5Pj8Z9N0A3KXXNWBeMB
=AsRb
-----END PGP SIGNATURE-----
