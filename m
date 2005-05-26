From: John Dong <john.dong@gmail.com>
Subject: Re: improving Reiserfs Performance
Date: Wed, 25 May 2005 20:36:23 -0400
Message-ID: <cfec5fb8050525173623d33018@mail.gmail.com>
References: <42947589.2020707@hyves.nl> <4294783C.5040001@darthvader.us>
	 <42947BCA.9080702@hyves.nl> <42949FDF.8000406@darthvader.us>
Reply-To: John Dong <john.dong@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_20299_23796205.1117067783513"
Return-path: <reiserfs-list-return-24150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42949FDF.8000406@darthvader.us>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_20299_23796205.1117067783513
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>=20
>=20
> ReiserFS actually performs the best under heavy hammering and thousands
> of files IMHO ;)

 One exception: In periods of extremely heavy read activity, writes do get=
=20
choked. And also vice versa. I can strongly feel this when doing some major=
=20
dd'ing, which probably won't simulate your load at all. The deadline I/O=20
scheduler did help out, though, for some reason. (my imagination?)

> Reiser4: again IMHO not yet, although your site would make a nice test
> bed :)

 I agree with this statement. I ran reiser4 on 2 of my system. In the
2.6.8days, one reiser4 volume unexpectedly started exhibiting random
hangs. fsck
didn't find anything, and the hangs were VERY hard to reproduce, if at all.=
=20
(sometimes APT's building dependencies tree would spark it, but it's like a=
=20
.1% chance). The other one, reiser4's working fine
(2.6.11.10<http://2.6.11.10>),
but I really miss xattr (Beagle). Oh well, can't have everything.

------=_Part_20299_23796205.1117067783513
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>ReiserFS actually performs t=
he best under heavy hammering and thousands<br>of files IMHO ;)</blockquote=
>

<div>&nbsp;</div>
<div>One exception: In periods of extremely heavy read activity, writes do =
get choked. And also vice versa. I can strongly feel this when doing some m=
ajor dd'ing, which probably won't simulate your load at all. The deadline I=
/O scheduler did help out, though, for some reason. (my imagination?)
</div>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Reiser4: again IMHO not yet, alt=
hough your site would make a nice test<br>bed :)</blockquote>
<div>&nbsp;</div>
<div>I agree with this statement. I ran reiser4 on 2 of my system. In the 2=
.6.8 days, one reiser4 volume unexpectedly started exhibiting random hangs.=
 fsck didn't find anything, and the hangs were VERY hard to reproduce, if a=
t all. (sometimes APT's building dependencies tree would spark it, but it's=
 like a .1% chance). The other one, reiser4's working fine (
<a href=3D"http://2.6.11.10">2.6.11.10</a>), but I really miss xattr (Beagl=
e). Oh well, can't have everything.<br>&nbsp;</div></div>

------=_Part_20299_23796205.1117067783513--
