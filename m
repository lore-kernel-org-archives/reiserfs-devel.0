From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] data logging patches available for 2.4.21-preX
Date: Mon, 27 Jan 2003 19:59:20 +0100
Message-ID: <3E358188.6060608@mb.tu-ilmenau.de>
References: <200301271914.26312.Dieter.Nuetzel@hamburg.de> <1043692402.15680.58.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Dieter Nuetzel <Dieter.Nuetzel@hamburg.de>, reiserfs-list <reiserfs-list@namesys.com>

On 01/27/2003 07:33 PM, Chris Mason wrote:
> On Mon, 2003-01-27 at 13:14, Dieter N=FCtzel wrote:
>=20
>>Hello Chris,
>>
>>as always very nice work!
>>I have it now running fine on top of 2.4.21-pre3-jam3 (2.4.21-pre3aa1).=

>>Some fiddling was necessary but went smooth after all.
>>My /home partition is mounted with -o data=3Dordered and the performanc=
e is=20
>>great. Sorry, no real benchmarks, yet.
>=20
> Thanks for trying them out.
>=20
>>But some question stay open:
>>Where is 01-akpm-sync_fs-fix-2.diff
>=20
> 01-akpm-sync_fs-fix-2.diff is in the 2.4.21 data logging directory you
> linked to below.
>=20
>> and 01-iput-deadlock-fix.diff?
>=20
> This is in the namesys pending directory, but doesn't apply cleanly
> yet.  I'm rediffing both the quota code and the data logging code on to=
p
> of 01-iput-deadlock-fix (or I might just steal Manuel's rediff, which i=
s
> still in my linuxworld backlog). =20

If they're o.k. just feel free to do so... :-))


Dieter, you still aren't subscribed?
I (only) changed the rejected things so the patches would apply and put=20
the files

for 2.4.20 @
http://manuel.krause.bei.t-online.de/downloads/2.4.20/03-data-logging-32b=
=2Ediff.gz

for 2.4.21-pre(3) @
http://manuel.krause.bei.t-online.de/downloads/2.4.21-pre/05-data-logging=
-33b.diff.gz

on friday.
( First apply 01-iput-deadlock-fix, then Chris' patches with the one=20
replaced from above. )

Bye,

Manuel

P.S.: The data=3Dordered mode (of which Chris wrote we should be careful =

with) runs fine here since the patches came out! :-)


>>Isn't it needed anylonger 'cause you merged them and SuSE's ftp isn't u=
pdated=20
>>yet? All files are the "old" one's from 15. January.
>>ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
>>
>>What about patch-2.4.20.rfs.06.05-transaction-overflow-fix-0.diff?
>>Should I put it on top, too?
>=20
> That is included in 05-data-logging-33.
>=20
> -chris

