From: Chris Mason <mason@suse.com>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 08:42:33 -0500
Message-ID: <1076938953.2482.1246.camel@watt.suse.com>
References: <4030391F.5080204@lig.net>
	 <200402161432.35178.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402161432.35178.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: "Stephen D. Williams" <sdw@lig.net>, reiserfs-list@namesys.com

On Mon, 2004-02-16 at 08:32, Dieter N=FCtzel wrote:

> > Is there a way to avoid practically (but not completely) locking up a
> > filesystem for many hours or days just to delete a file?

Yes, reiserfs needs to be nicer with the BKL.  This I can fix
easily...patching.

-chris


