From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 22:28:54 -0400
Message-ID: <b14e81f005090119283406eafa@mail.gmail.com>
References: <20050901134604.31ddd297@SiRiUS.home>
	 <20050901144842.34629bcf@SiRiUS.home> <4316F9CC.2090904@namesys.com>
	 <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com>
	 <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431726F2.1090508@redhat.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Staubach <staubach@redhat.com>
Cc: Hans Reiser <reiser@namesys.com>, vs@namesys.com, reiserfs-list@namesys.com

On 9/1/05, Peter Staubach <staubach@redhat.com> wrote:
> Hans Reiser wrote:
>=20
> >Research for filesystems generally says that as you get more than 85%
> >full the performance goes down, by a lot as you get close to 100%.  5%
> >is probably too little rather than too much.
> >
>=20
> Wow.  What is all that space used for?  Other journalling file systems th=
at
> I have seen have limited things like journals to a much smaller space,
> expressed in megabytes, and a much smaller number than thought originally=
.
> The bigger journals just didn't end up adding to the performance measurab=
ly
> and were just considered to be a waste of space that could be used more
> usefully.
>=20

Block-allocation efficiency.  Mainly to prevent super extreme
fragmentation of even the smallest files, and to give enough room to
do something that looks like repacking/defragmentation.

If you want to do repacking w/o 15-25%+ free space, then you're pretty
much looking at the kind of algorithm found in Windows 9x
(semi-offline defragment, and arrange blocks one at a time); online
repacking is painful without much free space (often you have to
repeatedly re consolidate the free space, which kinda messes things
up).

Of course, for me personally, Reiser4 will be about 20 times more
useful if it's a 40 GB disk and I can fill it up to 99% and defragment
it completely within 12 hours or so, with maybe 10-20 files which are
275 MBs in size.  Win XP and sure NTFS couldn't do it, even with
proprietary defragmenters...

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
