From: Kevin <coggy@redefine.org>
Subject: Re: access beyond end of device again
Date: Mon, 24 Jun 2002 10:30:45 -0700
Message-ID: <661330051733.20020624103045@redefine.org>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org>
Reply-To: Kevin <coggy@redefine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> On Mon, 24 Jun 2002, Oleg Drokin wrote:


> Can we see an fdisk -l of the relevant disk to see how big the filesystem 
> *should be* :)


I reformatted the partition since the last time it rebooted, but I
haven't changed the actual partition.  The only time I see the error
is when trying to read certain files.  Everything else seems to work
fine.  The drive is a 60g maxtor attached to an hpt366.  It is the
master on its channel, and there is no slave.  I'm running 2.4.18 with
reiserfsprogs 3.x.1c-pre4.

fdisk -l /dev/hdi1
Disk /dev/hdi: 16 heads, 63 sectors, 116336 cylinders
Units = cylinders of 1008 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdi1             1    116336  58633312+  83  Linux


df /dev/hdi1
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hdi1             58631516  39128508  19503008  67% /opt

