From: Alexander Skwar <listen@alexander.skwar.name>
Subject: Re: Resize of a reiser4 filesystem?
Date: Sun, 17 Jul 2005 18:10:28 +0200
Message-ID: <42DA82F4.6080102@mid.alexander.skwar.name>
References: <42DA6EBE.7020100@mid.alexander.skwar.name> <op.st2cqe1kth1vuj@localhost> <42DA780D.1070101@mid.alexander.skwar.name> <op.st2djmj7th1vuj@localhost>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25152-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.st2djmj7th1vuj@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com

PFC schrieb:
>> In 1.0.3, I also had that manpage - but I had no binary. Do you
>> have a binary?
>
> Looks like it is there :
[...]
> obj /sbin/resizefs.reiser4 c8acc86f223809b70ad1d36cc37da264 1110658498
>
> nyuu root # which resizefs.reiser4
> /sbin/resizefs.reiser4

Interesting. How did you build the package? What USE flags?

I've got:

[ebuild     UD] sys-fs/reiser4progs-1.0.3 [1.0.4] -debug +readline +static 851 kB

...

Okay, when I build the 1.0.3 package, I also get a /sbin/resizefs.reiser4.
But not in the 1.0.4 package.

Also not when I build it manually (ie. without Gentoo stuff).

Has resizefs.reiser4 been removed from 1.0.4?

Alexander Skwar
-- 
Used staples are good with SOY SAUCE!
