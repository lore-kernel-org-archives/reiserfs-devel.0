From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 12:45:47 +0200
Message-ID: <200408261245.47734.christian.mayrhuber@gmx.net>
References: <20040824202521.GA26705@lst.de> <20040825163225.4441cfdd.akpm@osdl.org> <1093510983.23289.6.camel@imp.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093510983.23289.6.camel@imp.csi.cam.ac.uk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Anton Altaparmakov <aia21@cam.ac.uk>, linux-fsdevel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Thursday 26 August 2004 11:03, Anton Altaparmakov wrote:

> Please don't forget that if the reiser4 features are merged as they are
> now, then we will likely be stuck with the API reiser4 chooses.  There
> will be tools that will rely on it springing up no doubt.
>
> Moving the reiser4 features to VFS later is fine and good, but what if
> the VFS doesn't want the same API for those features?  Either we would
> have to allow reiser4 to continue providing the old API even though the
> VFS now provides a new, shiny API or we would have to break all existing
> API users on reiser4.  Things like "I rebooted into the latest kernel
> and my computer failed to boot because essential app FOO failed to
> access the reiser4 API - Help!" spring to mind.

Andrew Morton wrote:
>b) accept the reiser4-only extensions with a view to turning them into
>=A0 =A0kernel-wide extensions at some time in the future, so all filesyste=
ms
>=A0 =A0will offer the extensions (as much as poss) or

If option b) is chosen Reiser4 can become a playground.

There is the reiser4() syscall which you surely don't want to implement for=
=20
other filesystems.
Once there is some experience with this new fancy stuff the dust what
is useful/insecure, etc. and what is not will settle and can be condensed
into a vfs api.
Apps like samba and user scripts will have to be adapted once this is
the case, but this should not be to big a problem if this stuff is marked=20
experimental.

People which want something stable can continue to use xattrs and a
magnitude of filesystems for now.

=2D-=20
lg, Chris

