From: Hans Reiser <reiser@namesys.com>
Subject: Re: Fibration questions
Date: Thu, 22 Jul 2004 11:14:21 -0700
Message-ID: <410003FD.9000500@namesys.com>
References: <40FE0B47.3010600@slaphack.com> <20040721063607.1A09015C92@mail03.powweb.com> <20040721083232.GA4990@nysv.org> <40FF3DAD.6020100@slaphack.com> <20040722100657.GC4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040722100657.GC4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Masover <ninja@slaphack.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Wed, Jul 21, 2004 at 11:08:13PM -0500, David Masover wrote:
> =20
>
>>- have our own area inside 'metas' which is always local, to allow
>>things like forcing particular files to always be in the cache
>>   =20
>>
Is this the sticky bit or new?

>
>Hmm. This is interesting. Difficult to wrap my brain around it, though :))
>Is it a bit like what I've understoon union mounts to be?
>Where would this data be stored, if it's in metas? Stat data on the
>local partition that's not bound to a specific file? Wouldn't fsck
>now fix that as a broken fs?-)
>
> =20
>
>>First question:  Can I manually enable/disable a particular plugin for a
>>particular directory?  (like how cryptocompress is supposed to be...)
>>   =20
>>
>
>Sure, but for example with fibration you can't re-fibrate a directory.
>You have to move the stuff out and back in after you've changed the
>policy.
>
>With tail policies you must access the file in order to get it moved
>out of tails, if you change the formatting to never.
>
>The Namesys Guys may want to correct me on those above notions, if
>they're totally wrong.
> =20
>
Some plugins are mutable, some are not, and some are mutable when empty=20
or some other condition applies.   We should document it for all of them.=20

