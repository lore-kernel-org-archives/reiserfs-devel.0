From: Heinz-Josef Claes <hjclaes@web.de>
Subject: [Fwd: Re: How to build a big file server]
Date: 05 Jun 2003 10:44:47 +0200
Message-ID: <1054802685.1997.29.camel@wusel.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14409-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

Am Don, 2003-06-05 um 10.25 schrieb Carl-Daniel Hailfinger:
> Heinz-Josef Claes wrote:
> > 
> > - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> > and one hot spare. The OS will be on separate hardware raid 1 on smaller
> > disks. Does anybody have experience with IDE controllers for the big
> > disks? Is it better to use hardware raid oder software raid
> > (performance)?
> 
> As long as you don't buy pseudo raid solutions like those from promise,
> you should be better off using hardware raid, especially if one of the
> disks fails. Performance-wise linux software raid may be faster.
> 
> > - BTW: I'm using a ZIP drive on the parallel port with reiserfs. Does it
> > make sense to put the journal for the ZIP drive on the hard disk of the
> > laptop?
> 
> NO. If you ever plan to use a zip disk with external journal on another
> PC, you are completely out of luck.
> 
I do not want to use it on another PC, that would be ok. But if I would
do this, is only the journal lost or the whole disk?

> 
> HTH,
> Carl-Daniel

