From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: FIFO files
Date: Tue, 17 Jun 2003 18:39:46 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20030617173946.GP15761@parcelfarce.linux.theplanet.co.uk>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net> <20030617170720.GC14124@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030617170720.GC14124@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

On Tue, Jun 17, 2003 at 07:07:20PM +0200, Cyrille Chepelov wrote:
>=20
> Le Tue, Jun 17, 2003, =E0 06:24:19PM +0200, Carl-Daniel Hailfinger a =E9c=
rit:
>=20
> > This facility has been present in linux for years. Just google for "spa=
rse
> > files".
>=20
> Yes sparse files would do. However, after a sizeable use of the facility,
> you'd end up with a giant hole at the beginning, whatever queued data, and
> EOF.=20
> What I want to do is the ability to just remove the hole in front (just as
> when there is no point in having a hole at the end of the file, you just
> truncate that hole out), so that seek(SEEK_BEGIN,0) positions me at the
> beginning of useful data (or EOF if my queue is empty).

A few thoughts.
1) Does it really need to be a single file?  Could a directory of files
for each "transaction" suffice?
2) Can the buffer be bounded?  If so, why not use a classic ring buffer?
3) If it can't be bounded, must it be simple file operations, or could
you use something like sleepy cat's db4 or mysql?

Come to think of it, if sparse files are used you could have a classic ring
buffer that is effectively unbounded.

--=20
Chris Dukes
I tried being reasonable once--I didn't like it.
