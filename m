From: Hans Reiser <reiser@namesys.com>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 07:22:46 -0800
Message-ID: <4030E046.1060007@namesys.com>
References: <4030391F.5080204@lig.net>	 <200402161432.35178.Dieter.Nuetzel@hamburg.de> <1076938953.2482.1246.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1076938953.2482.1246.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, "Stephen D. Williams" <sdw@lig.net>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Mon, 2004-02-16 at 08:32, Dieter N=FCtzel wrote:
>
> =20
>
>>>Is there a way to avoid practically (but not completely) locking up a
>>>filesystem for many hours or days just to delete a file?
>>>     =20
>>>
>
>Yes, reiserfs needs to be nicer with the BKL.  This I can fix
>easily...patching.
>
>-chris
>
>
>
>
> =20
>
Just a reminder, reiser4 fixes the V3 performance problems with holes.
