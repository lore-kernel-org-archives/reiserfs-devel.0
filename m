From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sat, 7 Aug 2004 01:46:59 -0500
Message-ID: <20040807065039.5BF4E15CBC@mail03.powweb.com>
References: <4114576B.8040305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20054-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4114576B.8040305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>



> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Friday, August 06, 2004 11:16 PM
> To: David Dabbs
> Cc: 'Philippe Gramoull=E9'; 'ReiserFS List'
> Subject: Re: Was able to reproduce "cp: cannot stat file.x: =
Input/output
> error"
>=20
> David Dabbs wrote:
>=20
> >i.e.
> >
> >	"%.c", '`' + (char) rnd
> >
> >If you exceed 26 then you will generate filenames that may cause
> problems.
> >
> >
> Problems that indicate reiser4 bugs or mongo bugs?
>=20

Mongo. The pipe character is not legal in a filename as an example.

I think I have discovered the problem - unless there was a reason mongo =
was
issuing mount/unmount commands at the start/end of a mongo 'run' as well =
as
before/after _each phase_. I just removed the mount/unmount calls that
bracket each phase execution and I am not seeing the errors. In =
addition,
reiser4 is running much faster. For instance, with the 'extra'
mount/unmounts r4 reported a REAL TIME stats of approximately 700 & 40 =
for
CREATE and MKFILES. After removing the mount/un calls it is reporting =
224 &
50 REAL TIME.

I will reboot and run a sequence of each of the filesystem configs =
overnight
and see what happens.

David



