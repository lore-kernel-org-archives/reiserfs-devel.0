From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 14:39:29 +0300
Message-ID: <3E3A6071.6060102@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030130234142.E8448@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Ragnar Kj=F8rstad wrote:

>On Thu, Jan 30, 2003 at 10:16:41PM +0300, Hans Reiser wrote:
> =20
>
>>>does anyone have some expirience with the reiserfs provided in redhat's
>>>2.4.9-e.3 kernel from its Advanced Server?
>>>     =20
>>>
>>Linux 2.4.x did not become stable until 2.4.18.  I strongly advise not=20
>>to use anything before 2.4.18 for a machine you care about.
>>
>>Well tested is not a substitute for stable.;-)
>>   =20
>>
>
>I don't know this kernel in particular, but in general RH's kernels are
>heavily patched, and 2.4.9-e.3 may actually be closer to 2.4.18 than
>2.4.9 from Linus.
>
>
>
> =20
>
Heavily patched plus RedHat famous QA process without millions of end=20
users testing it like Linus/Marcelo has (err, without them testing it=20
before it ships on the CD I should say....), and you think it will be=20
more stable than 2.4.9?

If you want a stable kernel for a mission critical server, the only=20
thing that works is to ask around and find out what Marcelo kernel has=20
been known stable for at least 6 weeks.

QA can do a lot to avoid wasting the time of testers with  bugs they=20
needn't have gone through the pain of hitting, but it can only do so much.

Marcelo is very responsible and effective in his management of the=20
stable kernel series.  He is unusually talented.  RedHat doesn't have=20
anyone in his league doing QA --- you could throw a dart in a room of=20
professional release managers, and chances are low that you would not do=20
better than RedHat did. =20

I would never choose to use a RedHat kernel over a Marcelo kernel.

What I find really interesting is that RedHat marketing manages to make=20
a lot of people think that a RedHat kernel is less adventurous than a=20
Marcelo kernel, when it is very much the other way around.

--=20
Hans


