From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] data logging patches available for 2.4.21-preX
Date: Mon, 27 Jan 2003 21:42:12 +0100
Message-ID: <3E3599A4.9080700@mb.tu-ilmenau.de>
References: <200301271914.26312.Dieter.Nuetzel@hamburg.de> <1043692402.15680.58.camel@tiny.suse.com> <200301271949.57132.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On 01/27/2003 07:49 PM, Dieter N=FCtzel wrote:
> Am Montag, 27. Januar 2003 19:33 schrieb Chris Mason:
>=20
>>On Mon, 2003-01-27 at 13:14, Dieter N=FCtzel wrote:
>>
>>>Hello Chris,
>>>
>>>as always very nice work!
>>>I have it now running fine on top of 2.4.21-pre3-jam3 (2.4.21-pre3aa1)=
=2E
>>>Some fiddling was necessary but went smooth after all.
>>>My /home partition is mounted with -o data=3Dordered and the performan=
ce is
>>>great. Sorry, no real benchmarks, yet.
>>
>>Thanks for trying them out.
>>
>>>But some question stay open:
>>>Where is 01-akpm-sync_fs-fix-2.diff
>>
>>01-akpm-sync_fs-fix-2.diff is in the 2.4.21 data logging directory you
>>linked to below.
>=20
> It was and I have it but it isn't any longer...
> Both 01- are missing, now

Must be an on-disk or ftp access problem known for SuSEs main server.
ftp://ftp.gwdg.de/pub/linux/suse/ftp.suse.com/people/mason/patches/data-l=
ogging/
still has all "old" files and _does_ transfer them ;-)
(Don't know how often they do their updates, though.)

Ooops. Getting web connection problems, too, in the moment I write.

>>> and 01-iput-deadlock-fix.diff?
>>
>>This is in the namesys pending directory, but doesn't apply cleanly
>>yet.
>=20
> OK, you moved it;-)

:-)) Yess. Oleg posted first about.

>>I'm rediffing both the quota code and the data logging code on top
>>of 01-iput-deadlock-fix (or I might just steal Manuel's rediff, which i=
s
>>still in my linuxworld backlog).
>=20
> Manuel's version (33b) had some trouble with -pre3aa1 (-pre3-jam3), too=
=2E

It's only adjusted for namesys' 01-iput-deadlock-fix and tested to work=20
with the rml.preempt-patch on here. Of course it's no developers work -- =

merely an editors one.

Where can I find the *jam* page with more information?

>>>Isn't it needed anylonger 'cause you merged them and SuSE's ftp isn't
>>>updated yet? All files are the "old" one's from 15. January.
>>>ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
>>>
>>>What about patch-2.4.20.rfs.06.05-transaction-overflow-fix-0.diff?
>>>Should I put it on top, too?
>>
>>That is included in 05-data-logging-33.
>=20
> Nice, no recompile needed then ;-)
>=20
> I'll do some "normal" vs data=3Djournal/ordered "time synctest -F -f -n=
 1 -t 100=20
> dir_name" tests, now.

BTW, does the on-disk FS structure matter with this comparison? (FS=20
content created with data=3Djournal/ordered <-> tested with=20
data=3Djournal/ordered) -- Or did this only have importance when Oleg=20
introduced the new block allocator?

> Maybe I integrate preemption...

DO exactly this.

Bye,

Manuel

