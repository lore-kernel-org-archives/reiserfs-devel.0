From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Gentoo bug 17974
Date: Thu, 17 Apr 2003 21:14:35 +0400
Message-ID: <200304172114.35013.vitaly@namesys.com>
References: <20030417164911.GK9893@lostlogicx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030417164911.GK9893@lostlogicx.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brandon Low <lostlogic@gentoo.org>
Cc: reiserfs-list@namesys.com

Hi,

On Thursday 17 April 2003 20:49, Brandon Low wrote:
> Hey, this bug was originally about the flush_buffers bug which Vitaly
> kindaly provided me a patch for, however if you look at the last severa=
l
> comment #25 and on, at least one user is having a different issue with =
the
> new reiserfsprogs.  My current thought is that it is some kind of actua=
l
> corruption of his journal, but I would appreciate any input you may hav=
e.

There is a new check for journal parameters were added which helps to=20
recover fs with relocated journal and in a few other cases. These paramet=
ers=20
were not stored correctly in old kernels before relocated journal appeare=
d.=20
This is nothing to worry about, and you can fix with fsck --rebuild-sb he=
lp=20
- say there to fix parameters in the jouranl by ones from the super block=
=2E

--=20
Thanks,
Vitaly Fertman
