From: Anders Widman <andewid@tnonline.net>
Subject: Re: --fix-fixable being ignored
Date: Sat, 8 Mar 2003 01:08:52 +0100
Message-ID: <1373592125.20030308010852@tnonline.net>
References: <Pine.LNX.4.33.0303082353370.16310-100000@hpc.me.utexas.edu>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33.0303082353370.16310-100000@hpc.me.utexas.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael stone <mike@hpc.me.utexas.edu>
Cc: reiserfs-list@namesys.com

> I have an ide raid server with a 610GB /home directory with errors. Running
> reiserfsck --check says it has found 6 errors which can be fixed with
> --fix-fixable.  But when I run it with --fix-fixable, the option is ignored and
> and a check is simply run again.  Any advice?  The filesystem errors are really
> screwing up quota services, so I need to get them fixed.  Thanks!

> The server is running Raidzone Linux (Modified version of RedHat 7.1).


> [root@ein /root]# reiserfsck --fix-fixable --logfile fix.log /dev/rze1

> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.x.1b

This  is  a  very old version of reiserfsprogs. Download new ones from
ftp://ftp.namesys.com/pub/reiserfsprogs/

//Anders

