From: Hans Reiser <reiser@namesys.com>
Subject: Re: On plugins, on-disk formatting and such
Date: Mon, 12 Apr 2004 11:09:24 -0700
Message-ID: <407ADB54.1070005@namesys.com>
References: <20040410100701.GE5229@nysv.org> <407AB278.8030209@namesys.com> <20040412153344.GG14134@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17875-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040412153344.GG14134@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com, Nikita Danilov <god@namesys.com>, vitaly@thebsh.namesys.com, vs <vs@thebsh.namesys.com>, grev@namesys.com

Markus T=F6rnqvist wrote:

>
> =20
>
>>This performance advantage is due to allocate on flush allowing us to=20
>>write in huge extents at flush time even though files get written to in=20
>>slow trickles.  This improves=20
>>   =20
>>
read performance dramatically.

>
>NO CARRIER+++
>
>Thanks a million for the answers!
>
> =20
>

grev, please update the benchmark to say the above paragraph.

--=20
Hans

