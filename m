From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 09:54:09 +0400
Message-ID: <20020625095409.A6209@namesys.com>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org> <661330051733.20020624103045@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <661330051733.20020624103045@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 24, 2002 at 10:30:45AM -0700, Kevin wrote:

> > Can we see an fdisk -l of the relevant disk to see how big the filesystem 
> > *should be* :)
> I reformatted the partition since the last time it rebooted, but I

Reformatted as in mkreiserfs?

> haven't changed the actual partition.  The only time I see the error
> is when trying to read certain files.  Everything else seems to work

Yeah, ones that contains invalid blocknumbers in metadata.

> fine.  The drive is a 60g maxtor attached to an hpt366.  It is the
> master on its channel, and there is no slave.  I'm running 2.4.18 with
> reiserfsprogs 3.x.1c-pre4.
> fdisk -l /dev/hdi1
> Disk /dev/hdi: 16 heads, 63 sectors, 116336 cylinders
> Units = cylinders of 1008 * 512 bytes
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hdi1             1    116336  58633312+  83  Linux
> /dev/hdi1             58631516  39128508  19503008  67% /opt

Numbers looks correct.

Bye,
    Oleg
