From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: missing files?
Date: Wed, 2 Feb 2005 20:14:23 +0300
Message-ID: <200502022014.23915.vitaly@namesys.com>
References: <1107318853.18354.214122527@webmail.messagingengine.com> <200502021910.15862.vitaly@namesys.com> <1107361529.20827.214162823@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107361529.20827.214162823@webmail.messagingengine.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Styer <michael@styer.net>, Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

On Wednesday 02 February 2005 19:25, Michael Styer wrote:
> On Wed, 2 Feb 2005 19:10:15 +0300, "Vitaly Fertman" <vitaly@namesys.com>
>
> said:
> > would you pack the metadata with     debugfs.reiser4 -P <device> |
> > bzip2 -c > <device>.bz2 and let us to download them?
>
> Is it possible to do this when the device is mounted rw without causing
> problems? Or would I have to unmount it and remount it ro?

yes, umount and mount ro.

-- 
Thanks,
Vitaly Fertman

