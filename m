From: Oleg Drokin <green@namesys.com>
Subject: Re: Permission denied on access to files; even as root
Date: Mon, 17 Jun 2002 09:12:10 +0400
Message-ID: <20020617091210.A18719@namesys.com>
References: <1024353028.26879.10577.camel@xserver> <3D0CC8F8.9090206@namesys.com> <1024354235.21004.10629.camel@xserver> <20020616222011.A15910@namesys.com> <1024358539.26879.10782.camel@xserver>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10753-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1024358539.26879.10782.camel@xserver>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 17, 2002 at 06:02:19PM -0600, Chris Worley wrote:

>     1) compile and install (configured as my previous kernel) the kernel
>     kernel-source-2.4.16.SuSE-32.i386.rpm at ftp.suse.com in
>     /pub/suse/i386/update/7.3/2.4.16-20020416 and
>     2) configure/make/install reiserfsprogs-3.x.1b, and 
>     3) remake my lvm initrd, then 
>     4) reboot single user and run reiserfsck (no args), 
> I'll have a working, fixed file system that will have large file
> capabilities?

No.
You must boot-off some rescue media.
Because root fs is mounted even in single user mode.

Bye,
    Oleg
