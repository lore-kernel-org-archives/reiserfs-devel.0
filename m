From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Cross compiling reiserfsprogs-3.6.11
Date: Fri, 21 Nov 2003 14:41:59 +0300
Message-ID: <200311211441.59259.vitaly@namesys.com>
References: <3FBDF571.5070100@sysgo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FBDF571.5070100@sysgo.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Bartusek <pba@sysgo.com>, Reiserfs-List@namesys.com

Hi Pavel, 

On Friday 21 November 2003 14:22, Pavel Bartusek wrote:
> Hi list,
>
> I have downloaded and tried to crosscompile the reiserfsprogs-3.6.11.
> Unfortunatelly, in the config.in is used the macro AC_TRY_RUN which
> prevents it from cross compiling. The attached patch replaces the macro
> and the simple C program for transforming CREDITS file, with a simple
> AWK script.
>
> NOTE: To recreate configure script run autoconf in the reiserfsprogs
> directory.
>
> regards
>
> Pavel Bartusek
>
> pba@sysgo.com

I will try the patch, thank you.
Vitaly Fertman
