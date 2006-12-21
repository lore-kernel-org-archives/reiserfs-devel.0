From: Christian Trefzer <ctrefzer@web.de>
Subject: Re: reiser4: data recovery after mkfs.reiser4?
Date: Thu, 21 Dec 2006 13:22:41 +0100
Message-ID: <20061221122241.GC20749@zeus.uziel.local>
References: <20061219202059.GS10358@zeus.uziel.local> <200612201505.38544.quinn@quinnh.org> <20061221102107.GB20749@zeus.uziel.local> <458A7168.6060808@dermichi.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <458A7168.6060808@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Weissenbacher <webmaster@dermichi.com>
Cc: reiserfs-list@namesys.com, Christian Trefzer <ctrefzer@web.de>

On Thu, Dec 21, 2006 at 12:35:04PM +0100, Michael Weissenbacher wrote:
> Could someone resend that info to the list? I'm sure others would be
> interested too.

I just replied I'd try what Vladimir said, and so I did - successfully.
But here you go, hoping this one will come through.  I even stopped
signing my outgoing email to this list, to no avail.

For me,

	fsck.reiser4 -u -O --build-fs $device

did the trick.  The file system was killed by a scripted mkfs.reiser4
followed by a mount and unmount.  Only two files were missing
afterwards, while lost+found was globbered with the obvious heap of
previously deleted files, most of them being 0 in size.

Kind regards,
Chris

