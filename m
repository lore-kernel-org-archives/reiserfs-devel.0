From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 22:38:31 +0400
Message-ID: <20040916183831.GL5137@backtop.namesys.com>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org> <20040916153835.GK5137@backtop.namesys.com> <20040916155248.GM26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040916155248.GM26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

On Thu, Sep 16, 2004 at 06:52:48PM +0300, Markus T=F6rnqvist wrote:
> On Thu, Sep 16, 2004 at 07:38:36PM +0400, Alex Zarochentsev wrote:
>=20
> >We are not going to add more intelligence to the in-kernel repacker modu=
le but
> >design an interface between repacker and user-space programs and impleme=
nt
> >reisizing alg. in user-space.=20
>=20
> This sounds a bit fishy; is it about having two repackers then?
> One in kernelspace and one in userspace?
> Will the kernelspace one be obsoleted?

on-line defragmenter requires its part to be in kernel space. at least node
locks cannot be exported _safely_ to the user space, I think.

>=20
> >> >unmergable units shouldn't be problem for the reiser4 kernel code.
> >> What are their significance; what do they mean?
> >two extent units (start1, len1), (start2, len2) can be merged into one (=
start1,
> >len1 + len2) because start1 + len1 =3D=3D start2.  I think no reiser4 ke=
rnel code
> >depends on that mergable extents do not exist.
>=20
> Unmergable units are then (start1 + len1) !=3D start2 because the repacker
> messed this up?=20

it can be so because of regular fs activity.   Current block allocation (and
flush algorithm) is not good for appending to existing files.  A free space
after well-allocated reiser4 tree or a well-allocated part of the reiser4 t=
ree
(in case of repacker) can be allocated randomly between new data blocks for
those files.

My opinion -- reiser4 is good in (re)allocating slums.  In case of allocati=
on
many small slums it may be not effective.  The idea of the reiser4 repacker=
 is
to create large slums and allow flush code to do its work.

>=20
> The kernel finds the extent units from their "old places" without optimiz=
ing
> them to one unit?

in some places, yes, those extents will be merged into one. but i agree, we
can't allow number of those units to grow unlimitedly.  IMHO it would be en=
ough
if the repacker will scan units and do what now is done by fsck -- merging =
of
mergeable units.

> --=20
> mjt

--=20
Alex.
