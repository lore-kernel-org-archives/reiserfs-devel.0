From: Hans Reiser <reiser@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 04 Aug 2004 10:47:35 -0700
Message-ID: <41112137.4010102@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <200408031750.00291.vitaly@namesys.com> <20040803135805.GK1284@nysv.org> <200408031819.51600.vitaly@namesys.com> <4110A38A.7040807@namesys.com> <20040804095513.GL1284@nysv.org> <20040804144144.2f5fe7b3@philou.gramoulle.local> <1091627399.4791.22.camel@watt.suse.com> <4273.192.168.0.30.1091628986.squirrel@sml.dyndns.org> <20040804142227.GR1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19999-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804142227.GR1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Thomas Graham <lkthomas@sml.dyndns.org>, Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Wed, Aug 04, 2004 at 10:16:26PM +0800, Thomas Graham wrote:
> =20
>
>>if a convertor are not done yet, I think we could wait until it's bundle
>>into the .tar.gz and we could use it, actually, do we HAVE TO do that
>>format changes ? or normal user could just ignore that except for some of
>>them who reach problem with that ?
>>   =20
>>
>
>I don't think you HAVE to do it, if you would, there would be a compensati=
on
>in the kernel, and Vitaly said there is not.
>
>So just avoid the reiser4progs like the plague, call the Namesys helpdesk,
>whatever and ask Vitaly to remove the file from the web, remove the
>code that changes the format, whatever.
>
>I just hope I won't hit a corruptive bug on my machine, it would be pretty
>anticlimactic if I did and I would lose data because it decides to
>change the format.
>
> =20
>
I don't understand why Vitaly cannot do one of the things suggested on=20
this thread: create an fsck option for people like Markus to use.

If Vitaly does that, problem solved, yes?

Chris is right that any disk format changes need to be made now. =20
Vitaly, send an email defining what you propose to do, and cc the list. =20
Do that now please.
