From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 15:35:02 +0300
Message-ID: <3E3A6D76.7080300@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no> <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de> <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030131122147.GE15359@marowsky-bree.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Lars Marowsky-Bree <lmb@suse.de>
Cc: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

I understand and support being pissed at Linus for calling it 2.4.0 when=20
it wasn't stable enough before 2.4.18 because VM and VFS were still=20
being changed, but Marcelo is pretty stable in all of his official=20
releases, and it is easy to get him to take good code.

Lars Marowsky-Bree wrote:

>On 2003-01-31T15:10:22,
>   Hans Reiser <reiser@namesys.com> said:
>
> =20
>
>>The distros are really doing their best to undermine the open source=20
>>community testing process that works so well....=20
>>
>>for them to not certify/support a stable Marcelo kernel is.... well it=20
>>makes me angry quite honestly....
>>   =20
>>
>
>Tell that to the ISVs. And the plain kernel, when it comes out, is usually
>simply not really useable as a distro kernel until, oh, dot twenty somethi=
ng
>or so, for a variety of reasons.
>
>>From "buzzwords" like 'enterprise features missing' or missing support for
>hardware to different schedulers, accomodations for IHVs/ISVs which mainli=
ne
>doesn't want (yet) etc. The way it works seems to be that distros test dri=
ve a
>lot of code before it gets merged into mainline, at the expense of mainline
>being slightly behind quite often.
>
So it should be the mainline that is certified....

>
>And at the time when distributions hit their respective deadlines, even a
>bunch of just plain fixes will have already piled up for the last stable
>vanilla kernel, so they get thrown in too, mostly from "pre" kernels.
>
This is legitimate (or at least it is for SuSE because they seem to be=20
able to do it well).

>
>I'm not saying this is good or bad, but it is just they way it is. I can't
>really see a distribution shipping a plain, unpatched kernel. Trust me. Ev=
ery
>distributor would love too, because it would lower cost for them. You know=
 how
>much highly qualified _work_ is needed to maintain a distribution kernel?
>Nobody does that out of their own free will.
>
>
>Sincerely,
>    Lars Marowsky-Br=E9e <lmb@suse.de>
>
> =20
>

I am not really opposed to vendors shipping their own kernels and=20
supporting them, but I am opposed to them not supporting an official=20
stable Marcelo kernel unless they have a specific reason not to.  The=20
Marcelo kernels need to be considered the official supported ones by the=20
entire community, regardless of what other ones might also be supported=20
by parts of the community.

--=20
Hans


