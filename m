From: "E. Gryaznova" <grev@namesys.com>
Subject: Re: problems in one or more man pages you maintain
Date: Tue, 17 Feb 2004 16:22:49 +0300
Sender: grev
Message-ID: <403215A9.66D25DD2@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hello,

This was fixed in reiserfsprogs-3.6.12.

Thanks,
Lena

Eric S. Raymond wrote :

> This is automatically generated email about problems in a man page for
which
> you appear to be responsible.  If you are not the right person or
list, tell
> me and I will attempt to correct my database.

> See http://catb.org/~esr/doclifter/problems.html for details on how
and
> why these patches were generated.  Feel free to email me with any
questions.

> Note: This patch does not change the mod date of the manual page.  You

> may wish to do that by hand.

> Problems with debugreiserfs.8:

> 1. Missing or garbled name section.  The most common form of garbling
> is a missing - or extra -. Or your manual page may have been generated

> by a tool that doesn't emit a NAME section as it should.  These
> problems make it impossible to lift the page to DocBook.  They
> can also confuse some implementations of man -k.

> --- debugreiserfs.8-orig        2003-11-26 19:25:49.000000000 -0500
> +++ debugreiserfs.8     2003-11-26 19:26:25.000000000 -0500
> @@ -3,7 +3,7 @@
>  .\"
>  .TH DEBUGREISERFS 8 "January 2002" "Reiserfsprogs 3.6.4"
>  .SH NAME
> -debugreiserfs
> +debugreiserfs \- debugging tool for the ReiserFS filesystem
>  .SH SYNOPSIS
>  .B debugreiserfs
>  [
> Problems with reiserfstune.8:

> 1. Missing or garbled name section.  The most common form of garbling
> is a missing - or extra -. Or your manual page may have been generated

> by a tool that doesn't emit a NAME section as it should.  These
> problems make it impossible to lift the page to DocBook.  They
> can also confuse some implementations of man -k.

> --- reiserfstune.8      2003-02-16 18:47:41.000000000 -0500
> +++ reiserfstune.8      2003-02-16 18:48:07.000000000 -0500
> @@ -3,7 +3,7 @@
>  .\"
>  .TH REISERFSTUNE 8 "January 2002" "Reiserfsprogs-3.6.2"
>  .SH NAME
> -reiserfstune
> +reiserfstune \- tune parameters of a Reiser file system
>  .SH SYNOPSIS
>  .B reiserfstune
>  [ \fB-f\fR ]

> --
>                              Eric S. Raymond




