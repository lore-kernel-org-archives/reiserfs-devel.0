From: Hans Reiser <reiser@namesys.com>
Subject: Re: a hosed reiserfs
Date: Wed, 07 Jul 2004 12:18:05 -0700
Message-ID: <40EC4C6D.4090108@namesys.com>
References: <3DF9165145FACB4C96977FF650C1E9040C46A168@its-mail1.its.corp.gwl.com>	<20040707055420.GI4990@nysv.org> <20040707115534.510b1246@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040707115534.510b1246@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

Philippe Gramoull=E9 wrote:

>Hello,
>
>Feature wise, the lack of reiser4 quota support is definitely a showstoppe=
r for us, and maybe for a lot of people too.
>So currently i'm focusing on performance of Reiser4 with databases, mainly=
 MySQL.
>
>Thanks
>
>Philippe
>
>--
>Lycos Europe
>
>
>On Wed, 7 Jul 2004 08:54:20 +0300
>mjt@nysv.org (Markus T=F6rnqvist) wrote:
>
>  | Since feature-wise I don't see Reiser4 that lacking. Maybe the biggest=
 issue
>  | is of course viewports, but since that's coming by DARPA, there's stuff
>  | like copy-on-capture and chdir to a non-executable file and syscalls.
>  | But nothing mission critical or half-broken. Right?
>
>
> =20
>
Sigh.  Yes, if someone would sponsor quotas, it would be nice.  Thanks=20
for pointing this out Philippe, it is a good candidate for what should=20
be sponsored by someone looking to sponsor something.

Hans
