From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 status as of this weekend
Date: Sun, 16 May 2004 10:30:59 -0700
Message-ID: <40A7A553.2020901@namesys.com>
References: <003a01c4377d$d653eac0$7d02a8c0@toronto.chantrynetworks.com> <40A68F75.2030306@namesys.com> <20040515221017.GL1232@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040515221017.GL1232@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Russell Treleaven <rtreleaven@chantrynetworks.com>, ReiserFS List <reiserfs-list@namesys.com>

Markus T=F6rnqvist wrote:

>On Sat, May 15, 2004 at 02:45:25PM -0700, Hans Reiser wrote:
>
> =20
>
>>Some users are saying that it is rock solid (please contradict dear=20
>>readers).  We the developers can use iozone to make it crash by mmapping =

>>   =20
>>
>
>I haven't had problems for a long time.
>
>Then again, I haven't used iozone ever.
>
> =20
>
>>well structured for managing memory under that circumstance.   The clean =

>>fix for that for reiser4 given the way the Linux design is,  is=20
>>substantial work to do right, and is in progress.  We currently have a=20
>>fix that costs performance, and are fixing the performance issue (which=20
>>is fixable but requires code....).
>>   =20
>>
>
>Would you say this is the biggest issue?
> =20
>
It is the only issue that I know of.

>What about NFS?
> =20
>
fixed by nikita recently but not released.  See next snapshot.

> =20
>
>>We would probably have it ready to ship this week, but Nikita is leaving =

>>Namesys after having done a great job here for way too little pay, and=20
>>   =20
>>
>
>!!!
>This is terrible news...
>
yeah, I agree.

> I'm sorry, I'm at a loss of words...
>
>Nikita, hope to see you on IRC still and thanks for all the great
>work and the help you've given me and everyone else.
>
>Best of luck.
>
> =20
>
>>that means we need to have him and Saveliev spend a full week doing a=20
>>code review before he goes, and Zam and I are busy earning the next=20
>>month payroll money by doing work for digeo, and such is the free=20
>>software "business".  Sigh.
>>   =20
>>
>
>This may be a tactless question, but what about the grant for implementing
>views? It was insufficient?
> =20
>
It supports me and one programmer for the first 6 months.  I did not bid=20
my being paid a high enough salary to pay the rest of the company on it,=20
so in order to get get beyond phase 1, so I must work 2 jobs while=20
having a long commute to one of them and running Namesys.  I have to do=20
at least half the work in Phase 1 because we need to start the project=20
by doing the architectural work....  Also, it requires that 2/3 of the=20
work (by cost) be done in the US, and the moscow embassy has gone into=20
total asshole mode and isn't giving work visas to most russians.  Still,=20
we will try to get work visas in 6 months.  I hope that it being for DoD=20
work will increase the chance of getting visas.

>Have you also considered making it easier for the community to write code?
>I'm not talking about write-access handed liberally to bitkeeper, but
>maybe some coding guide and stuff could be more prominently available?
> =20
>
It is in the source code..... we have the best commented source code in=20
the kernel (Andrew Morton is the only other kernel person who comments=20
code well that I know of).

> =20
>
>>So, stay tuned, and check again in two weeks.
>>   =20
>>
>
>Best of luck to the rest of you too.
>
> =20
>
thanks
