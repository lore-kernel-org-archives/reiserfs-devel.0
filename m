From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: 2.6.15 Bug? New security model?
Date: Wed, 8 Feb 2006 22:46:15 +0100
Message-ID: <200602082246.15613.bernd-schubert@gmx.de>
References: <200602080212.27896.bernd-schubert@gmx.de> <200602081314.59639.bernd-schubert@gmx.de> <20060208205033.GB22771@shell0.pdx.osdl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060208205033.GB22771@shell0.pdx.osdl.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Wright <chrisw@osdl.org>
Cc: John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

> >
> > After the problem came up, I already suspected something like this and
> > therefore already had the kernel recompiled without xattr support, so I
> > don't know why lsattr shows something for 2.6.15 and nothing for 2.6.13.
>
> attrs !=3D xattrs

Ah, I thought its the same.

>
> Couple of things:
>
> 1) what does 'grep attrs_cleared /proc/fs/reiserfs/on-disk-super' show?

Er, you mean /proc/fs/reiserfs/{partition}/on-disk-super?

bernd@bathl ~>grep attrs_cleared /proc/fs/reiserfs/hda6/on-disk-super
flags:  1[attrs_cleared]


>
> 2) does mount -o attrs ... make a difference?

Yes, 2.6.13 now makes the same trouble. No difference with 2.6.15.3.=20
I played with mount -o noattrs, this makes no difference with 2.6.13, but h=
as=20
some effects to 2.6.15.3. Creating files in /var/run is possible again,=20
lsattr gives "lsattr: Inappropriate ioctl for device While reading flags=20
on /var/run", but deleting files in /var/run is still impossible (still=20
rather bad for the init-scripts).


Thanks,
	Bernd

=2D-=20
Bernd Schubert
PCI / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg

