From: "Michael Styer" <michael@styer.net>
Subject: Re: missing files?
Date: Wed, 02 Feb 2005 15:21:16 -0500
Message-ID: <1107375676.23787.214182957@webmail.messagingengine.com>
References: <1107318853.18354.214122527@webmail.messagingengine.com>
   <200502021910.15862.vitaly@namesys.com>
   <1107361529.20827.214162823@webmail.messagingengine.com>
   <200502022014.23915.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200502022014.23915.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

On Wed, 2 Feb 2005 20:14:23 +0300, Vitaly Fertman said:
> On Wednesday 02 February 2005 19:25, Michael Styer wrote:
> > On Wed, 2 Feb 2005 19:10:15 +0300, Vitaly Fertman said:
> > > would you pack the metadata with     debugfs.reiser4 -P <device> |
> > > bzip2 -c > <device>.bz2 and let us to download them?
> >
> > Is it possible to do this when the device is mounted rw without
> > causing problems? Or would I have to unmount it and remount it ro?
>
> yes, umount and mount ro.

OK, thanks. I'll send you the link off-list.

Mike
