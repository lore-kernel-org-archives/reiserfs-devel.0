From: Yury Umanets <umka@namesys.com>
Subject: Re: [patch] for configure.in for reiser4progs
Date: Thu, 31 Jul 2003 08:59:41 +0400
Message-ID: <1059627580.21907.10.camel@haron.namesys.com>
References: <3F255543.8010409@mrs.umn.edu>	<3F255920.3070804@mrs.umn.edu>
	 <1059455220.7235.13.camel@haron.namesys.com>
	 <1059459151.14479.5.camel@localhost>
	 <1059459291.27547.3.camel@haron.namesys.com>
	 <1059460212.1881.1.camel@localhost>
	 <1059460229.10291.0.camel@haron.namesys.com>	<3F26C062.4070409@mrs.umn.edu>
	 <1059542267.14095.11.camel@haron.namesys.com>
	 <16168.4042.555742.436499@laputa.namesys.com>
	 <16168.4402.451095.462365@laputa.namesys.com>
	 <16168.4948.764071.889907@laputa.namesys.com>
	 <3F28605A.5040609@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F28605A.5040609@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

On Thu, 2003-07-31 at 04:18, Grant Miner wrote:
> This makes autoconf stop complaining on my machine.
> 
> ______________________________________________________________________
> --- configure.in	2003-07-30 18:58:35.000000000 -0500
> +++ myconfigure.in	2003-07-30 18:58:33.000000000 -0500
> @@ -42,7 +42,7 @@
>  AC_DEFINE_UNQUOTED(LIBREISER4_MIN_INTERFACE_VERSION, $LIBREISER4_INTERFACE_AGE)
>  
>  # Macro for checking libaal
> -AC_DEFUN(AC_CHECK_LIBAAL,
> +AC_DEFUN([AC_CHECK_LIBAAL],
>  [
>  
>  AC_CHECK_LIB($1, aal_device_open, ,
Thanks, will take a look.
-- 
We're flying high, we're watching the world passes by...

