From: Hans Reiser <reiser@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 04 Aug 2004 01:51:22 -0700
Message-ID: <4110A38A.7040807@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <200408031750.00291.vitaly@namesys.com> <20040803135805.GK1284@nysv.org> <200408031819.51600.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408031819.51600.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: =?KOI8-R?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Tuesday 03 August 2004 17:58, Markus T=F6rnqvist wrote:
> =20
>
>>On Tue, Aug 03, 2004 at 05:50:00PM +0400, Vitaly Fertman wrote:
>>   =20
>>
>>>No kernel patch is needed for the disk format change, however fsck may
>>>report about some corruptions on an existent fs if a block was allocated
>>>for some data and has become a backup one. Fsck.reiser4 --build-fs is
>>>able to fix it of course, although the data in these blocks are lost the=
n.
>>>     =20
>>>
These blocks refers to blocks that were used by files and are now backup=20
super blocks?  These blocks could be critical database files, etc.?

If yes, then please pull this off our website until you come up with a=20
scheme that I am sure will not create more user problems than it solves,=20
on average.

>>What kind of probabilities and amounts of data are we talking about?
>>   =20
>>
>
>The first gig has 22 backup blocks and they are distributed expotentially.
>The first backup copy was probably almost always used for other needs.
>
> =20
>

