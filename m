From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-tree hangs
Date: Fri, 11 Apr 2003 13:56:18 +0400
Message-ID: <200304111356.18574.vitaly@namesys.com>
References: <20030411015312.GA20912@coloppl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13641-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030411015312.GA20912@coloppl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Folini <christian.folini@netnea.com>
Cc: reiserfs-list@namesys.com

Hi,

> do_pass_2: The block (level=3D35848, nr_items=3D39427, free_space=3D308=
15
> rdkey), marked as a leaf on the first two passes, is not a leaf! Will b=
e
> skipped.
> do_pass_2: The block (level=3D35848, nr_items=3D39427, free_space=3D308=
15
> rdkey), marked as a leaf on the first two passes, is not a leaf! Will b=
e
> skipped.

This appears when you compile the progs on one computer not statically
and run it on another computer with other libs. Could you tell me what ve=
rsion
of reiserfsprogs you use and what glibc version you had on the mashine yo=
u
compiled reiserfsprog on and glibc version you have on the mashine you ru=
n=20
reiserfsck on?

--=20
Thanks,
Vitaly Fertman
