From: Hans Reiser <reiser@namesys.com>
Subject: Re: a hosed reiserfs
Date: Wed, 07 Jul 2004 00:08:38 -0700
Message-ID: <40EBA176.3030202@namesys.com>
References: <3DF9165145FACB4C96977FF650C1E9040C46A168@its-mail1.its.corp.gwl.com> <20040707055420.GI4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040707055420.GI4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: "Burnes, James" <james.burnes@gwl.com>, redeeman@metanurb.dk, Reiserfs Mailinglist <reiserfs-list@namesys.com>

Markus T=F6rnqvist wrote:

>On Tue, Jul 06, 2004 at 04:40:31PM -0600, Burnes, James wrote:
> =20
>
>>I would assume there is some money in there.  They do seem to fund
>>various opensource activities.
>>   =20
>>
>
>As in events? Or really active software development?
>
>Well, Reiser4 has some stuff that's yet todo and some stuff that'd
>be nice to have and maybe even a bug or two, so I guess all money
>would be welcome...
>
>If the tail-packing bug would be fixed, or whatever remains, it'd
>be great if Namesys wrote the online (profiling) repacker/resizer/fsck(?)
>program to generate money.=20
>
>This would be even better if cryptcompress work would be done at the same =

>time, since that's something people look forward to and something that's=20
>not quite there yet. Cryptcompress might be one reason for people to move
>to Reiser4 and thus more buyers for the repacker.
>
>Since feature-wise I don't see Reiser4 that lacking. Maybe the biggest iss=
ue
>is of course viewports, but since that's coming by DARPA, there's stuff
>like copy-on-capture and chdir to a non-executable file and syscalls.
>But nothing mission critical or half-broken. Right?
> =20
>
We do the core traditional fs stuff, which is far less than being a=20
general purpose namespace.

> =20
>
>>Maybe filling out an app for grant would be good.  Is there an available
>>non-profit wrapper around Reiser4?  There must be some sort of shell for
>>the DARPA funding to have happened.
>>   =20
>>
>
>Non-profit wrapper? You mean some non-profit "welfare" organization?
>Why can't DARPA fund a company?
> =20
>
They do.;-)

Unfortunately the state department won't let my team into the US, and=20
this particular (SBIR) darpa grant requires the work be done in the US.

Also, it starts slowly requiring my personal time heavily, pays not a=20
lot to me, and then, what I just found out, after 5 months of doing the=20
exploratory work, you have a 2/3 chance of not getting funded to do the=20
serious funding phase of the work.

I will never apply for an SBIR again I think.  I cannot afford to waste=20
5 months of design work and then not get funded, these grants are for=20
students and new professors.

Oh, and the EU doesn't care much to fund non-europeans.

It all involves so much more than just doing good work and getting=20
paid.... whine whine.;-)
