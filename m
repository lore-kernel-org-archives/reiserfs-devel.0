From: Hans Reiser <reiser@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 04 Aug 2004 14:44:03 -0700
Message-ID: <411158A3.1060707@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <20040804142227.GR1284@nysv.org> <41112137.4010102@namesys.com> <200408042251.41149.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408042251.41149.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: =?UTF-8?B?TWFya3VzIFTDtnJucXZpc3Q=?= <mjt@nysv.org>, Thomas Graham <lkthomas@sml.dyndns.org>, Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Wednesday 04 August 2004 21:47, Hans Reiser wrote:
> =20
>
>>Markus T=D0=96rnqvist wrote:
>>   =20
>>
>>>On Wed, Aug 04, 2004 at 10:16:26PM +0800, Thomas Graham wrote:
>>>     =20
>>>
>>>>if a convertor are not done yet, I think we could wait until it's bundle
>>>>into the .tar.gz and we could use it, actually, do we HAVE TO do that
>>>>format changes ? or normal user could just ignore that except for some =
of
>>>>them who reach problem with that ?
>>>>       =20
>>>>
>>>I don't think you HAVE to do it, if you would, there would be a
>>>compensation in the kernel, and Vitaly said there is not.
>>>
>>>So just avoid the reiser4progs like the plague, call the Namesys helpdes=
k,
>>>whatever and ask Vitaly to remove the file from the web, remove the
>>>code that changes the format, whatever.
>>>
>>>I just hope I won't hit a corruptive bug on my machine, it would be pret=
ty
>>>anticlimactic if I did and I would lose data because it decides to
>>>change the format.
>>>     =20
>>>
>>I don't understand why Vitaly cannot do one of the things suggested on
>>this thread: create an fsck option for people like Markus to use.
>>
>>If Vitaly does that, problem solved, yes?
>>
>>Chris is right that any disk format changes need to be made now.
>>Vitaly, send an email defining what you propose to do, and cc the list.
>>Do that now please.
>>   =20
>>
>
>I have written a converter (an option to debugfs), testing it,=20
>it does well for the last half an hout already.=20
>
>I am going to release another internal snapshot with the explanation=20
>in README how to use it.
>
> =20
>
good answer.
