From: Hans Reiser <reiser@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Wed, 23 Jul 2003 17:39:16 +0400
Message-ID: <3F1E9004.6040800@namesys.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <1058892649.5042.29.camel@tiny.suse.com> <3F1D7DD8.3010806@namesys.com> <200307231425.17476.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307231425.17476.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

Dieter N=FCtzel wrote:

>Am Dienstag, 22. Juli 2003 20:09 schrieb Hans Reiser:
> =20
>
>>Chris Mason wrote:
>>   =20
>>
>>>On Tue, 2003-07-22 at 12:43, Hans Reiser wrote:
>>>     =20
>>>
>>>>The answer to the below is to use reiser4.  It uses extents, and two 64
>>>>bit numbers are all that is needed to store the hole.  V4 will be ready
>>>>for testing in a few days, and will ship for real users at the end of
>>>>summer we hope.
>>>>
>>>>Fixing V3 is  the wrong answer: this is one of its design flaws.
>>>>       =20
>>>>
>>>It's important to remember that releasing v4 doesn't automatically
>>>convert all existing v3 users to it.  This is the kind of thing we
>>>should try to fix without making major design changes to v3.  It's at
>>>least worth talking about, "use v4" can't always be the answer.
>>>     =20
>>>
>>V3 is in feature freeze.   Unfortunately, determining what is a feature
>>and what is a bug is a process based not just on the user experience,
>>but on the structure of the code.  The proper fix for this bug is to add
>>a feature called extents.   This  belongs in, and is in, V4.  V4 will be
>>available very soon.
>>   =20
>>
>
>And "coplete" stable from the beginning? --- Come on.
>
I have been consistently clear in everything I say that V4 will not be=20
as stable as V3 for quite some time.  That is because V3 will not=20
significantly change except for bug fixes, whereas V4 is fresh new code.

V3 has been dropping in bug reports for quite some time.  Unfortunately=20
I have to say we got some this month (direct IO stuff).

>
> =20
>
>>Adding features, like new kinds of items, will disturb the stability of
>>V3.  V3 needs to be zero defect.  It is now in a phase in its lifetime
>>where conservatism is appropriate.
>>   =20
>>
>
>I'll accept this fix in V3 before I "move" to V4.
>
>-Dieter
>
>
>
> =20
>
Most users need for their filesystems to at some point finally get left=20
alone and not disturbed.  This is the whole idea behind freeze and=20
release based development.

Extents are a nice feature, but they belong in V4 not V3.   Effort spent=20
developing extents for V3 is better spent stabilizing V4 which already=20
has them and a lot more.

--=20
Hans


