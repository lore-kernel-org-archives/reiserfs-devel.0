From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  accidentally formatted vfat over reiserfs, recoverable?
Date: Mon, 22 Sep 2003 16:34:58 +0400
Message-ID: <20030922163458.A10869@t-raenon.nmd.msu.ru>
References: <Pine.OSF.4.58.0309191844050.245847@kosh.hut.fi> <200309200024.22525.vitaly@namesys.com>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200309200024.22525.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Tommi Sakari Uimonen <tuimonen@cc.hut.fi>, reiserfs-list@namesys.com

Sat, Sep 20, 2003 at 12:24:22AM +0400, Vitaly Fertman wrote:
> On Friday 19 September 2003 20:17, Tommi Sakari Uimonen wrote:
> > Hi. I had a reiserfs (3.6.11 from debian unstable) partition and I made a
> > 'mkfs.vfat -F 32' on it. Is there any chance of getting the data from the
> > old reiserfs partition?
> >
> > I have not written onto it since, and mkfs.vfat performed it's duties very
> > promptly, so I guess it just wrote something  "small" to the beginning of
> > the partition. (The partition is  about 100GB so I would have noticed if
> > it had done some serious formatting on it)
> >
> > Maybe some dd if=/dev/hdb5 of=... magic or what?
> >
> > Tommi Uimonen
> 
> Hi Tommi,
> 
> this was the user mistake and we provide the support for such in terms of 
> our www.namesys.com/support.html page.
theres no easy way around, but i think you should 

1. backup the partiution with dd.
and then...
try to recreate superblock
and then fsck with  rebuild-tree.
altough i'm not vitaly and not expert there

-- 
"the liberation loophole will make it clear.."
lex lyamin
