From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 16:30:45 +0100
Message-ID: <200402161630.45740.Dieter.Nuetzel@hamburg.de>
References: <4030391F.5080204@lig.net> <1076938953.2482.1246.camel@watt.suse.com> <4030E046.1060007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4030E046.1060007@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Montag, 16. Februar 2004 16:22 schrieb Hans Reiser:
> Chris Mason wrote:
> >On Mon, 2004-02-16 at 08:32, Dieter N=FCtzel wrote:
> >>>Is there a way to avoid practically (but not completely) locking up a
> >>>filesystem for many hours or days just to delete a file?
> >
> >Yes, reiserfs needs to be nicer with the BKL.  This I can fix
> >easily...patching.
> >
> >-chris
>
> Just a reminder, reiser4 fixes the V3 performance problems with holes.

Sorry Hans,

that dosen't matter.
How stable is Reiser4 for production, now?

It IS a very nice FS, but not yet.
We need a solution, now.

=2D-=20
Dieter N=FCtzel
@home: <Dieter.Nuetzel () hamburg ! de>
