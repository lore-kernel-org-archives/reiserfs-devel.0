From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: production use of reiserfs
Date: Fri, 28 Nov 2003 16:20:00 +0100
Message-ID: <200311281620.00960.Dieter.Nuetzel@hamburg.de>
References: <200311280846.12697.ivan@t1.unisoftbg.com> <200311281242.18139.ivan@t1.unisoftbg.com> <16327.13886.709901.444317@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16327.13886.709901.444317@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ivan <ivan@t1.unisoftbg.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, reiserfs-list@namesys.com

Am Freitag, 28. November 2003 12:49 schrieb Nikita Danilov:
> ivan writes:

> Yes, I meant money can buy you better support. :)
>
>  > I am searching info to know if reiserfs is production ready.
>
> People are using it successfully. It is standard file system in some
> distributions. It has been used on some very large highly loaded
> servers.
>
>  > And also to know if exists any problems in redhat implementation for
>  > reiserfs.
>
> That's hard to tell, because we don't know whether redhat modified
> reiserfs code in any way. What you can do is to download 2.4.20 kernel
> from kernel.org and do "diff -rup" between /usr/src/linux/fs/reiserfs
> and /stock-2.4.20-kernel/fs/reiserfs.

Maybe RedHat Linux whipping the file systems with to OLD reiserfsprogs after 
crash?

Which version (reiserfsck -V) do you have?

Greetings,
	Dieter
