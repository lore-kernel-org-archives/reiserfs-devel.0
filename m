From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 18:09:36 +0100
Message-ID: <20041230170936.GB23354@schmorp.de>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yiannis Mavroukakis <yiannis@jaguarfreight.com>
Cc: reiserfs-list@namesys.com

On Thu, Dec 30, 2004 at 11:52:58AM -0000, Yiannis Mavroukakis <yiannis@jagu=
arfreight.com> wrote:
> Your "proven" reasoning sounds a bit strange to me..Microsoft (aka major
> distributor at least in my books) had her filesystems "in the field" for
> ages, does this prove any of them good (or bad for that matter)?

You state that "proven" is the same as "good", but why you do so escapes
me. In general, you can easily prove that black =3D=3D white (etc.) by such
illogical reasoning.

The reasoning in fact is that file systems which are out in the field for
years have _known_ properties, are proven to work with some amount of
software, possibly including software that specicially has workarounds for
filesystem shortcomins (i.e. squid with it's multi-dir-hierarchy, which is
just a workaround for basically all non-reiserfs filesystems, and now also
for reiserfs3 filesystems, which also doesn't cope with millions of files
in a dir, as opposed to the original claims by it's developers).

This is cerftainly true for microsofts filesystems: you know what to expect
=66rom vfat or ntfs, for example.

For new filesystems, the issue is completely different. Look at the "file
is a directory" approach that formerly was the default in reiserfs. This
breaks a number of programs, despite the expectancy by the reiserfs
authors that this is not the case (in my experience, stat "path/." to
quickly check wether sth. is a file or a directory is pretty common). Unless
the filesystem is in the field for some time these bugs will not be found.

--=20
                The choice of a
      -----=3D=3D-     _GNU_
      ----=3D=3D-- _       generation     Marc Lehmann
      ---=3D=3D---(_)__  __ ____  __      pcg@goof.com
      --=3D=3D---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=3D=3D=3D=3D=3D/_/_//_/\_,_/ /_/\_\      XX11-RIPE
