From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Wed, 2 Jun 2004 22:01:52 +0400
Message-ID: <200406022201.52387.vitaly@namesys.com>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com> <pan.2004.06.02.10.19.28.403959@unternehmen.com> <200406022143.08104.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18982-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406022143.08104.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Helge Hielscher <hhielscher@unternehmen.com>, reiserfs-list@namesys.com

On Wednesday 02 June 2004 21:43, Vitaly Fertman wrote:
> > The metadata is on its way. But what is strange, I have run fsck.reiser4
> > directly after fsck.reiser4 and here is what I get now (ups, just noticed
> > that I use the old version again, hope that it does not matter much)
>
> this is a different error -- now you have the internal reiser4 tree broken.
>
> > # fsck.reiser4 /dev/hda6
> > ***** Tree Traverse Pass: scanning the reiser4 internal tree.
> > Error: Node (409174), item (4): item has the wrong length (62). Should be
> > (56). Error: Node (409174), item (4): broken item found.
> > Error: Node (409174): the node is broken. Pointed from the node (430549),
> > item (7), unit (0). The whole subtree is skipped.

> probably you have upgraded to some newer snapshot?

yes, the reiser4progs-0.5.4 does not know about the plugin set 
in StatData. You have to wait for the next reiser4progs snapshot. 
Or get rid of not standard plugins for now (i am talking about 
one file /boot/map here which was made 'extents only').

-- 
Thanks,
Vitaly Fertman

