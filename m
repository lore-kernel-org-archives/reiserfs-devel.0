From: Edward Shushkin <edward@namesys.com>
Subject: Re: The situation at hand and in the future
Date: Wed, 02 Jun 2004 16:51:43 +0400
Message-ID: <40BDCD5F.7000706@namesys.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org> <40B919DF.3040408@slaphack.com> <20040530122713.GX4990@nysv.org> <40BA802C.5070907@slaphack.com> <40BC83AF.2030504@namesys.com> <20040602080556.GC4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18962-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040602080556.GC4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Tue, Jun 01, 2004 at 05:25:03PM +0400, Edward Shushkin wrote:
> =20
>
>>is builtin and can not be changed by users. The user can only assign=20
>>plugins. For each
>>kind of transform there is special "none" plugin which means absence of=20
>>this transform.
>>   =20
>>
>
>Is there any chance of this looking more like a crypto/ directory
>than a crypto file?
> =20
>
'Looking more' sounds incorrect here (does  directory  look more then=20
file? )
You might want special (directory) object plugin. All ideas should be=20
implemented
via its methods..

>I really liked David Masover's ideas and I'd like to hear if they
>are somehow infeasible.
>
I am a bit confused: usually I inspire everyone that something is=20
feasible ;)

Edward.

>To me they make sense as practical.
>
>Thanks!
>
> =20
>
