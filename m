From: Chris Mason <mason@suse.com>
Subject: Re: 2.5.9 kreiserfsd and sync hung in D state
Date: 23 Apr 2002 07:35:34 -0400
Message-ID: <1019561734.16728.150.camel@tiny>
References: <20020423073327.A21535@rushmore>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020423073327.A21535@rushmore>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rwhron@earthlink.net
Cc: reiserfs-list@namesys.com

On Tue, 2002-04-23 at 07:33, rwhron@earthlink.net wrote:
> I didn't notice any of the 2.5.8.pending fixes in 
> ChangeLog-2.5.9, and I haven't tried them with 2.5.9 yet.
> 
> Linux 2.5.9 without any patches.
> 
> Uninteruptable sleep created by:
> mkreiserfs /dev/sdc2
> mount -t reiserfs -o defaults,noatime /dev/sdc2 /fs2
> cpio -pdm filenames |  /fs2
> sync			# this is what has hung
> 
> ps aux
> USER       PID %CPU %MEM   VSZ  RSS TTY      STAT START   TIME COMMAND
> root      1113  0.0  0.0     0    0 ?        DW   03:49   0:00 [kreiserfsd]
> root      1265  0.0  0.0  1636  488 ttyp0    D    03:52   0:00 sync

A sysrq-t would probably help.

-chris


