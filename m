From: "David Dabbs" <david@dabbs.net>
Subject: Re: [PATCH] use S_ISDIR() in link_path_walk() to decide whether the last path component is a directory
Date: Mon, 13 Sep 2004 16:34:15 -0500
Message-ID: <20040913213429.6813115CA8@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'ReiserFS List' <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org
Cc: viro@parcelfarce.linux.theplanet.co.uk, 'Alex Zarochentsev' <zam@namesys.com>


>viro wrote
>On Mon, Sep 13, 2004 at 11:49:22AM +0400, Alex Zarochentsev wrote:
> Hi,
>=20
> This patch does not allow open(name, O_DIRECTORY) to be successful for
> non-directories in reiser4.  It replaces ->i_op->lookup !=3D NULL "is =
dir"
> check for the last path component by explicit S_ISDIR(->i_mode) check. =

>=20
> Regardless to reiser4, S_ISDIR() looks more clear there.
>
>The only objection here is that right now we are guaranteed that cwd =
and
>root of every task have non-NULL ->lookup().  With your patch all we =
have
>is S_ISDIR().
>
>So we either need to check for non-NULL ->lookup() before the beginning =
of
>loop in link_path_walk() or split the flag in two.  I would rather do =
the
>former...
>=A0

I'm working on something similar, but with alternate pathname resolution
when the path begins with exactly two slashes. Only pseudocode here =
because
I do not have access to my box:

In path_lookup()

    if (*name =3D=3D '/') {
       if (*(name+1)=3D=3D'/' && *(name+2)=3D=3D':') {
          name+=3D3;
          nd->flags &=3D LOOKUP_SLASHSLASH
          if (*name!=3D'/')
            goto relative;
       }
   =20

In link_path_walk()
    When LOOKUP_SLASHSLASH, handle names as follows:

    If this !S_ISDIR()

       next.name  Behavior=20
       ------------------------------------------------------
       .          Same if i_op && i_op->lookup, else -ENOTDIR.
       ..         Same.
       ...        Okay if i_op && i_op->lookup, else -ENOTDIR.
       otherwise  Fails with -ENOENT.
      =20
    If S_ISDIR()
       any        Same behavior


I tested the //: & flag code and this works (in my limited testing =
yesterday
with bash and some test programs).=20

This should limit "hybrid" file-directories to only one valid =
subdirectory,
the "special metadata" directory. Thus, if a new/modified app wants to
create/access metadata, it would do something like the following:

   # relative path
   cd /test
   touch foo.txt=09
   mkdir foo.txt/...     # FAILS
   mkdir //:foo.txt/...
   echo JayRandom > //:foo.txt/.../Author

   # absolute path
   echo blahblah > //:/test/foo.txt/.../Title

   mkdir testdir
   mkdir //:testdir/...
   echo no > //:testdir/.../VirusScan

Yes, this means that a) ... is "removed" from the namespace and b) =
directory
metadata directories are visible to na=EFve applications/users while =
those for
files are not. But it does provide "metadata-aware" apps/users a =
consistent
way to access this info for both files and directories without resorting =
to
openat(). Since SuS provides for "implementation-specific" pathname
resolution when pathnames begin with exactly two slashes this should be
legal(?), if desired.

This doesn't address the issue of "active" metadata objects such as =
reiser4
provides e.g. foo.txt/metas/perms. That's a different discussion.=20


David



