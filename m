From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 21:32:37 +0300
Message-ID: <3E3AC145.4050006@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <1044021310.15684.154.camel@tiny.suse.com> <3E3A8515.5010701@namesys.com> <200301311903.35770.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301311903.35770.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, Lars Marowsky-Bree <lmb@suse.de>, reiserfs-list@namesys.com

Dieter N=FCtzel wrote:

>Am Freitag, 31. Januar 2003 15:15 schrieb Hans Reiser:
> =20
>
>>Chris Mason wrote:
>>   =20
>>
>
> =20
>
>>>The fact that nobody actually ships a vanilla kernel should make it
>>>pretty clear the stock releases are not ready for the tasks our
>>>customers need them for.
>>>     =20
>>>
>>This is not clear to me at all.
>>   =20
>>
>
>Only two little examples (VM not ReiserFS ;-):
>
>Oracle and SAP need -aa VM.
>Some pieces missing for ages in the stock kernel.
>
>-ac (base for RH?) has the O(1)-scheduler (-aa now, too) and low-lat.
>
>Nothing in stock.
>
>Peace,
>	Dieter
>
>PS Go on with your great ReiserFS 3.x (when will we see data-logging in st=
ock)=20
>
Chris is working on that now.

>and Reiser4 work.
> =20
>
We are starting to hit the harder bugs now.... sigh....

but we have fixed the performance loss we had in August.... :)

Best,

--=20
Hans


