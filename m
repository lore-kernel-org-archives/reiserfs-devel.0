From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: What does this mean?
Date: Mon, 8 Jul 2002 12:27:20 -0400
Message-ID: <200207081227.20586.kuba@mareimbrium.org>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com> <3D29BA3F.7010201@tpg.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10930-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D29BA3F.7010201@tpg.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Basil Chupin <blchupin@tpg.com.au>
Cc: reiserfs-list@namesys.com

> >>on executing "reiserfsck --check --logfile check.log  /dev/hda7" this
> >>produces the error message "/dev/hda7 is mounted w/ write permissions,
> >>can not check it." I cannot find this message documented so am wondering
> >>what it means, and what do I need to do in order to be able to check the
> >>integrity of the reiserfs on my sytem. Can anyone please help?
> >
> >You can only check integrity on read-only mounted fs.
> >You can only fix stuff on completely unmounted fs.

> All this is perplexing me, firstly because I am not tryng to change
> anything- all I am trying to do is to do what the blurb about reiserfs
> says which is "do this to CHECK the fs"; and secondly, how could one
> ever effect any corrections to the fs if it cannot be mounted!?

To *check* the filesystem at all, mount it in read-only mode. Oftentimes you 
need to stop most services to do that, say go to singleuser mode via
# telinit 1

To *fix* the filesystem, it *must* be unmounted, period. Typically, you will 
want to make a minimal "rescue" root partition on your hard drive, reboot 
with this partition given to kernel as the root (root=/dev/hdxxxx), and then 
run reiserfsck on your main root partition.

Cheers, Kuba Ober
