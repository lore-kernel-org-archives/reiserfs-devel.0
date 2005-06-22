From: Bedros Hanounik <2bedros@gmail.com>
Subject: Re: reiser4 plugins
Date: Tue, 21 Jun 2005 22:11:13 -0700
Message-ID: <f18a8d98050621221153d9495@mail.gmail.com>
References: <20050620235458.5b437274.akpm@osdl.org>
	 <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com>
	 <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com>
	 <42B8BB5E.8090008@pobox.com> <42B8E834.5030809@slaphack.com>
Reply-To: Bedros Hanounik <2bedros@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1313_19082218.1119417073125"
Return-path: <reiserfs-list-return-24443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B8E834.5030809@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

------=_Part_1313_19082218.1119417073125
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

First of all, I'm HW engineer, and don't know much about implementation=20
details of FS. I know some coding, I've coded for different levels from=20
linux device drivers to GUI's, but I know a lot about integration between=
=20
levels of hierarchy.

I generally agree with the idea that high level functionality such as=20
compressing, encrypting, ...etc should not be implemented in the FS. But,=
=20
the term "high-level" is a relative term and three years down the road, wha=
t=20
we consider high-level now becomes low-level.

my suggestion is to keep everything as is. if Hans and the reiser4 guys wan=
t=20
to implement high level stuff as plug-ins that's fine. If the VFS guys want=
=20
to implement the same functionality in VFS on top of the system FS; they ca=
n=20
do it too.

BUT PLEASE MAKE THE API COMPATIBLE!!!!

programmers on both sides should discuss the features and make sure the API=
=20
is compatible.

in such a scenario, if I want to compress a directory called /mystuff/data=
=20
on a reiser4 FS, I could call the VFS API to do so; The VFS finds that the=
=20
system is reiser4 and compression is supported, so it passes the call to=20
reiser4. On another hand, if the system is ext3 and it doens't support=20
compression, VFS performs the task and passes the file to ext3.

My point is that the effect of gravity is upon us, high level stuff will=20
become low-level in a short time. Moreover, at the low level in FS and=20
especially when done by FS guys, functions such as compression can be done=
=20
more efficiently than in VFS space.

my worries are that the waste of effort by implementing the same=20
functionality in two levels in the hierarchy, and incompatible API can caus=
e=20
serious headache.

just my two cents.

-Bedros



On 6/21/05, David Masover <ninja@slaphack.com> wrote:
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Jeff Garzik wrote:
> > Hans Reiser wrote:
> >
> >> Christoph,
> >>
> >> Reiser4 users love the plugin concept, and all audiences which have
> >> listened to a presentation on plugins have been quite positive about
> >> it. Many users think it is the best thing about reiser4. Can you
> >> articulate why you are opposed to plugins in more detail? Perhaps you
> >> are simply not as familiar with it as the audiences I have presented
> >> to. Perhaps persons on our mailing list can comment.....
> >>
> >> In particular, what is wrong with having a plugin id associated with
> >> every file, storing the pluginid on disk in permanent storage in the
> >> stat data, and having that plugin id define the set of methods that
> >> implement the vfs operations associated with a particular file, rather
> >> than defining VFS methods only at filesystem granularity?
> >
> >
> > You're basically implementing another VFS layer inside of reiser4, whic=
h
> > is a big layering violation.
>=20
> There's been sloppy code in the kernel before. I remember one bit in
> particular which was commented "Fuck me gently with a chainsaw." If I
> remember correctly, this had all of the PCI ids and the names and
> manufacturers of the corresponding devices -- in a data structure -- in
> C source code. It was something like one massive array definition, or
> maybe it was a structure. I don't remember exactly, but...
>=20
> The point is, this was in the kernel for quite awhile, and it was so
> ugly that someone would rather be fucked with a chainsaw. If something
> that bad can make it in the kernel and stay for awhile because it
> worked, and no one wanted to replace it -- nowdays, that database is
> kept in userland as some nice text format -- then I vote for putting
> Reiser4 in the kernel now, and ironing the sloppiness ("violation") out
> later. It runs now.
>=20
> > This sort of feature should -not- be done at the low-level filesystem
> > level.
>=20
> I agree there, too. In fact, some people have suggested that all
> "legacy" (read: non-reiser) filesystems should be implemented as Reiser4
> plugins, effectively killing VFS.*
>=20
> So, Reiser4 may eventually take over VFS and be the only Linux
> filesystem, but if so, it will have to do it much more slowly. Take the
> good ideas -- things like plugins -- and make them at least look like
> incremental updates to the current VFS, and make them available to all
> filesystems.
>=20
> Eventually, this would result in a full merge of Reiser and Linux, such
> that the only thing left of "Reiser4" are a few plugins -- things like
> storage plugins and maybe some more exotic things like fibration that I
> don't really understand.
>=20
> > What happens if people decide plugins are a good idea, and they want
> > them in ext3? We need massive surgery to extract the guts from reiser4.
>=20
> And here is the crucial point. Reiser4 is usable and useful NOW, not
> after it has undergone massive surgery, and Namesys is bankrupt, and
> users have given up and moved on to XFS. But the massive surgery should
> happen eventually, partly to make all filesystems better (see below),
> and partly to make the transition easier and more palatable for those
> who don't work for Namesys.
>=20
>=20
>=20
>=20
>=20
> * Imagine ext3 as a storage-level plugin for reiser4. You get one
> benefit immediately -- lazy allocation. Lazy allocation is nice both
> for fragmentation and for busy systems writing and nuking a lot of
> temporary files. Imagine a file which is written and then deleted
> before it hits disk -- it should never touch the disk, regardless of the
> underlying storage layout.
>=20
> Other benefits are subtler but inevitable. Right now, it would be an
> understatement to say that there's duplication of effort between ext3,
> xfs, and reiser4. And yet, I don't think there are many core design
> decisions that influence my decision as to which I pick up. I just want
> it to be fast, stable, and have a stable on-disk format so I don't have
> to reformat too often. I honestly don't care about how XFS is
> segmenting the disk, or Reiser4 packs really well, or ext3 can be read
> as ext2 and flushes to disk every five seconds. These are the kinds of
> things which should be set to sane defaults, tunable for enterprise
> users, but are not really enough to warrant completely separate code=20
> bases.
>=20
> I would imagine that it wouldn't be too long after this before an
> uber-fs rose, something which combined enough of the strong points of
> all the existing Linux filesystems that no one would use anything else.
> But, Linux still needs support for FAT32, ISO9660, UDF, and all the
> other filesystems which won't go away as easily as XFS and ext3, and it
> would be nice if these could all share as much code as possible.
>=20
>=20
> I don't know if storage plugins really work that way, but they should.
>=20
> I think. I don't work here.
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.1 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>=20
> iQIVAwUBQrjoNHgHNmZLgCUhAQIYYw/7BWZ0gVvy0ln5tRo405yUoRHJ/jVFBGyP
> 5pQ610ECMZORVWRO1qP/NXbvGZwDjEggM5iIeahsGqnBWzNGDsB6RslMUZAxzCYy
> iAovi0881zoARf3dmhKrDgbGkvNLPTx+/ypa20oRcHLnyI+NAjerUxNuvGc79PJn
> Ybm9JhX6tQsqGIKjZye9uNDHCifLqzA1gdxucPwWo9sz4ymzM9FgsMGvb+IxrU50
> 2a2G2K6AHcH+nkomEHw3xgY3PmUZUy0s2hQDSkJx6dCido7fGZwwykaSXm4IZs9s
> xZqBxKx32G/LDnDV3W8gpj8ZisUE+58kefRbIjo4Ml6IzgXvQqpRjaQOuz8JoKDX
> 9KUV43tcZkPpK+neIYPQYpXCrdMQqB5+ISpbNKuz/Z/abkcVw1042sy0EKM+/VnD
> n3Jr7PpSyk0lfCyADr+33qnqPQRFq02gQTohg9FheoMthhV01aaeGW5ExmTM/Wwa
> 6Dmv/qnn2oNImi+Ebz5u3Lbnz7lL3MVpRL4aoMmEOVUB3xhehnxesf//yacBmwj9
> M/3KVae9epwX4K6yi8qQXzH4160IBFHpWUxBLc9LnOZlHQuZ+Fz3BIrbKQBvmaHT
> 7lrwi0Os6TmiBGMSFd6OUWHcYs4p97aMw30NG33fCL6e8X6oNVFwwnJXZpBPN1Mr
> +lrsVAywKEI=3D
> =3DrHdK
> -----END PGP SIGNATURE-----
>

------=_Part_1313_19082218.1119417073125
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

First of all, I'm HW engineer, and don't know much about implementation
details of FS. I know some coding, I've coded for different levels from
linux device drivers to GUI's, but I know a lot about integration
between levels of hierarchy.<br>
<br>
I generally agree with the idea that high level functionality such as
compressing, encrypting, ...etc should not be implemented in the FS.
But, the term &quot;high-level&quot; is a relative term and three years dow=
n the
road, what we consider high-level now becomes low-level.<br>
<br>
my suggestion is to keep everything as is. if Hans and the reiser4 guys
want to implement high level stuff as plug-ins that's fine. If the VFS
guys want to implement the same functionality in VFS on top of the
system FS; they can do it too.<br>
<br>
BUT PLEASE MAKE THE API COMPATIBLE!!!!<br>
<br>
programmers on both sides should discuss the features and make sure the API=
 is compatible.<br>
<br>
in such a scenario, if I want to compress a directory called
/mystuff/data on a reiser4 FS, I could call the VFS API to do so; The
VFS finds that the system is reiser4 and compression is supported, so
it passes the call to reiser4. On another hand, if the system is ext3
and it doens't support compression, VFS performs the task and passes
the file to ext3.<br>
<br>
My point is that&nbsp; the effect of gravity is upon us, high level
stuff will become low-level in a short time. Moreover, at the low level
in FS and especially when done by FS guys, functions such as
compression can be done more efficiently than in VFS space.<br>
<br>
my&nbsp; worries are that the waste of effort by implementing the same
functionality in two levels in the hierarchy, and incompatible API can
cause serious headache.<br>
<br>
just my two cents.<br>
<br>
-Bedros<br>
<br>
<br><br><div><span class=3D"gmail_quote">On 6/21/05, <b class=3D"gmail_send=
ername">David Masover</b> &lt;<a href=3D"mailto:ninja@slaphack.com">ninja@s=
laphack.com</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D=
"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padd=
ing-left: 1ex;">
-----BEGIN PGP SIGNED MESSAGE-----<br>Hash: SHA1<br><br>Jeff Garzik wrote:<=
br>&gt; Hans Reiser wrote:<br>&gt;<br>&gt;&gt; Christoph,<br>&gt;&gt;<br>&g=
t;&gt; Reiser4 users love the plugin concept, and all audiences which have
<br>&gt;&gt; listened to a presentation on plugins have been quite positive=
 about<br>&gt;&gt; it.&nbsp;&nbsp;Many users think it is the best thing abo=
ut reiser4.&nbsp;&nbsp;Can you<br>&gt;&gt; articulate why you are opposed t=
o plugins in more detail?&nbsp;&nbsp;Perhaps you
<br>&gt;&gt; are simply not as familiar with it as the audiences I have pre=
sented<br>&gt;&gt; to.&nbsp;&nbsp;Perhaps persons on our mailing list can c=
omment.....<br>&gt;&gt;<br>&gt;&gt; In particular, what is wrong with havin=
g a plugin id associated with
<br>&gt;&gt; every file, storing the pluginid on disk in permanent storage =
in the<br>&gt;&gt; stat data, and having that plugin id define the set of m=
ethods that<br>&gt;&gt; implement the vfs operations associated with a part=
icular file, rather
<br>&gt;&gt; than defining VFS methods only at filesystem granularity?<br>&=
gt;<br>&gt;<br>&gt; You're basically implementing another VFS layer inside =
of reiser4, which<br>&gt; is a big layering violation.<br><br>There's been =
sloppy code in the kernel before.&nbsp;&nbsp;I remember one bit in
<br>particular which was commented &quot;Fuck me gently with a chainsaw.&qu=
ot;&nbsp;&nbsp;If I<br>remember correctly, this had all of the PCI ids and =
the names and<br>manufacturers of the corresponding devices -- in a data st=
ructure -- in
<br>C source code.&nbsp;&nbsp;It was something like one massive array defin=
ition, or<br>maybe it was a structure.&nbsp;&nbsp;I don't remember exactly,=
 but...<br><br>The point is, this was in the kernel for quite awhile, and i=
t was so<br>ugly that someone would rather be fucked with a chainsaw.&nbsp;=
&nbsp;If something
<br>that bad can make it in the kernel and stay for awhile because it<br>wo=
rked, and no one wanted to replace it -- nowdays, that database is<br>kept =
in userland as some nice text format -- then I vote for putting<br>Reiser4 =
in the kernel now, and ironing the sloppiness (&quot;violation&quot;) out
<br>later.&nbsp;&nbsp;It runs now.<br><br>&gt; This sort of feature should =
-not- be done at the low-level filesystem<br>&gt; level.<br><br>I agree the=
re, too.&nbsp;&nbsp;In fact, some people have suggested that all<br>&quot;l=
egacy&quot; (read: non-reiser) filesystems should be implemented as Reiser4
<br>plugins, effectively killing VFS.*<br><br>So, Reiser4 may eventually ta=
ke over VFS and be the only Linux<br>filesystem, but if so, it will have to=
 do it much more slowly.&nbsp;&nbsp;Take the<br>good ideas -- things like p=
lugins -- and make them at least look like
<br>incremental updates to the current VFS, and make them available to all<=
br>filesystems.<br><br>Eventually, this would result in a full merge of Rei=
ser and Linux, such<br>that the only thing left of &quot;Reiser4&quot; are =
a few plugins -- things like
<br>storage plugins and maybe some more exotic things like fibration that I=
<br>don't really understand.<br><br>&gt; What happens if people decide plug=
ins are a good idea, and they want<br>&gt; them in ext3?&nbsp;&nbsp;We need=
 massive surgery to extract the guts from reiser4.
<br><br>And here is the crucial point.&nbsp;&nbsp;Reiser4 is usable and use=
ful NOW, not<br>after it has undergone massive surgery, and Namesys is bank=
rupt, and<br>users have given up and moved on to XFS.&nbsp;&nbsp;But the ma=
ssive surgery should
<br>happen eventually, partly to make all filesystems better (see below),<b=
r>and partly to make the transition easier and more palatable for those<br>=
who don't work for Namesys.<br><br><br><br><br><br>* Imagine ext3 as a stor=
age-level plugin for reiser4.&nbsp;&nbsp;You get one
<br>benefit immediately -- lazy allocation.&nbsp;&nbsp;Lazy allocation is n=
ice both<br>for fragmentation and for busy systems writing and nuking a lot=
 of<br>temporary files.&nbsp;&nbsp;Imagine a file which is written and then=
 deleted<br>before it hits disk -- it should never touch the disk, regardle=
ss of the
<br>underlying storage layout.<br><br>Other benefits are subtler but inevit=
able.&nbsp;&nbsp;Right now, it would be an<br>understatement to say that th=
ere's duplication of effort between ext3,<br>xfs, and reiser4.&nbsp;&nbsp;A=
nd yet, I don't think there are many core design
<br>decisions that influence my decision as to which I pick up.&nbsp;&nbsp;=
I just want<br>it to be fast, stable, and have a stable on-disk format so I=
 don't have<br>to reformat too often.&nbsp;&nbsp;I honestly don't care abou=
t how XFS is<br>
segmenting the disk, or Reiser4 packs really well, or ext3 can be read<br>a=
s ext2 and flushes to disk every five seconds.&nbsp;&nbsp;These are the kin=
ds of<br>things which should be set to sane defaults, tunable for enterpris=
e<br>users, but are not really enough to warrant completely separate code b=
ases.
<br><br>I would imagine that it wouldn't be too long after this before an<b=
r>uber-fs rose, something which combined enough of the strong points of<br>=
all the existing Linux filesystems that no one would use anything else.
<br> But, Linux still needs support for FAT32, ISO9660, UDF, and all the<br=
>other filesystems which won't go away as easily as XFS and ext3, and it<br=
>would be nice if these could all share as much code as possible.<br><br>
<br>I don't know if storage plugins really work that way, but they should.<=
br><br>I think.&nbsp;&nbsp;I don't work here.<br><br>-----BEGIN PGP SIGNATU=
RE-----<br>Version: GnuPG v1.4.1 (GNU/Linux)<br>Comment: Using GnuPG with T=
hunderbird -=20
<a href=3D"http://enigmail.mozdev.org">http://enigmail.mozdev.org</a><br><b=
r>iQIVAwUBQrjoNHgHNmZLgCUhAQIYYw/7BWZ0gVvy0ln5tRo405yUoRHJ/jVFBGyP<br>5pQ61=
0ECMZORVWRO1qP/NXbvGZwDjEggM5iIeahsGqnBWzNGDsB6RslMUZAxzCYy<br>iAovi0881zoA=
Rf3dmhKrDgbGkvNLPTx+/ypa20oRcHLnyI+NAjerUxNuvGc79PJn
<br>Ybm9JhX6tQsqGIKjZye9uNDHCifLqzA1gdxucPwWo9sz4ymzM9FgsMGvb+IxrU50<br>2a2=
G2K6AHcH+nkomEHw3xgY3PmUZUy0s2hQDSkJx6dCido7fGZwwykaSXm4IZs9s<br>xZqBxKx32G=
/LDnDV3W8gpj8ZisUE+58kefRbIjo4Ml6IzgXvQqpRjaQOuz8JoKDX<br>9KUV43tcZkPpK+neI=
YPQYpXCrdMQqB5+ISpbNKuz/Z/abkcVw1042sy0EKM+/VnD
<br>n3Jr7PpSyk0lfCyADr+33qnqPQRFq02gQTohg9FheoMthhV01aaeGW5ExmTM/Wwa<br>6Dm=
v/qnn2oNImi+Ebz5u3Lbnz7lL3MVpRL4aoMmEOVUB3xhehnxesf//yacBmwj9<br>M/3KVae9ep=
wX4K6yi8qQXzH4160IBFHpWUxBLc9LnOZlHQuZ+Fz3BIrbKQBvmaHT<br>7lrwi0Os6TmiBGMSF=
d6OUWHcYs4p97aMw30NG33fCL6e8X6oNVFwwnJXZpBPN1Mr
<br>+lrsVAywKEI=3D<br>=3DrHdK<br>-----END PGP SIGNATURE-----<br></blockquot=
e></div><br>

------=_Part_1313_19082218.1119417073125--
