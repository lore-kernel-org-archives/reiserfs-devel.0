From: =?iso-8859-1?q?berny=AE?= <berny@dwami.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Wed, 16 Mar 2011 10:19:57 +0000
Message-ID: <201103161019.57264.berny@dwami.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

Ok, thank you Edward.
I will try again with the 2.6.38 when you will release a patch, for now=
 I think I will reformat with=20
XFS just to have the copy/move working :-)
I prepared a pc with reiser4 and 2.6.38 (that got released today) diffe=
rent from this main one,=20
waiting for the patch.



Thank you, again.
Paolo












On Tuesday 15 March 2011 17:35:18 you wrote:
> On 03/09/2011 01:38 PM, Berny wrote:
> > On 03/09/2011 10:32 AM, Serkan Kaba wrote:
> >> 2011/3/9 berny=AE<berny@dwami.com>:
> >>> Hi Edward,
> >>> first thank you for your work.
> >>>=20
> >>> I'm using reiser4 for all my partitions on my working machine wit=
h
> >>> kernel 2.6.37 with no problems
> >>> except one annoying one that is going on from months.
> >>> When I copy a file (whatever) from one directory to another with
> >>> konqueror, dolphin or krusader with
> >>> kde 4.6.1 the file get copied, it's size is correct but it is emp=
ty.
> >>>=20
> >>> This happen only in the partitions formatted with reiser4 and not=
 on
> >>> the xfs, reiser3 ones.
> >>>=20
> >>>=20
> >>> Thank you,
> >>> warm regards,
> >>> Paolo
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe
> >>> reiserfs-devel" in
> >>> the body of a message to majordomo@vger.kernel.org
> >>> More majordomo info at http://vger.kernel.org/majordomo-info.html
> >>=20
> >> I suspect that it's similar to what I experienced with gnome upgra=
de
> >> back in time. My problem was due to issues in splice code path whi=
ch
> >> GNOME switch to for file copying along the way. I already reported
> >> this to GNOME [1] as well as this ML [2,3]. The issue appearing in
> >> only uncompressed partitions is interesting, Edward already asked =
me
>=20
> It seems this is because of the following not implemented "todo":
>=20
> int write_begin_unix_file(struct file *file, struct page *page,
> 			  loff_t pos, unsigned len, void **fsdata)
> {
>=20
> ...
> 	if (info->container =3D=3D UF_CONTAINER_TAILS) {
> 		warning("edward-1563", "Option not implemented");
> 		drop_exclusive_access(info);
> 		return -EINVAL;
> 	}
>=20
> Tail conversion should go in this branch.
> I'll try to implement it for .38, and we'll see,
> if this was really the issue.
>=20
> Thanks,
> Edward.
>=20
> >> if mine was, which isn't. My current workaround is to use a patche=
d
> >> version of glib (part of gnome libs) that avoids using splice for
> >> reiser4 targets. If you have a KDE bugzilla account, can you also
> >> provide them links for discussions in the list as well as the GNOM=
E
> >> bug?
> >>=20
> >> 1: https://bugzilla.gnome.org/show_bug.cgi?id=3D615346
> >> 2: http://marc.info/?l=3Dreiserfs-devel&m=3D127096098705179&w=3D2
> >> 3: http://marc.info/?l=3Dreiserfs-devel&m=3D129275181431455&w=3D2
> >> --
> >=20
> > So it seems that also kde probably use this library to splice data =
from
> > a pipe, I saw that it seemed resolved in 2.6.36 but it is here agai=
n in
> > 2.6.37.
> > I read your links, very good information.
> > I never know that kde was using this splice for copying things.
> > Sorry but I'm not member of kde bugzilla, I was simply searching fo=
r
> > information.
> > The problem is that only reiser4 exhibit this problem on my system =
so I
> > guessed that was a problem of this file system, this is the reason
> > because I didn't fill a bug on the other bugzilla.
> >=20
> > Thanks,
> > Paolo
> >=20
> >> To unsubscribe from this list: send the line "unsubscribe
> >> reiserfs-devel" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at http://vger.kernel.org/majordomo-info.html
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > reiserfs-devel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at http://vger.kernel.org/majordomo-info.html
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
