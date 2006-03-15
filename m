From: Hans Reiser <reiser@namesys.com>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 10:29:00 -0800
Message-ID: <44185CEC.3010103@namesys.com>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com> <1142336718.7415.55.camel@tribesman.namesys.com> <194f62550603140732j6ef10757j@mail.gmail.com> <4417BEC4.6060506@namesys.com> <20060315085745.GA21609@wintermute>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28270-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060315085745.GA21609@wintermute>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Andreas_Sch=E4fer?= <gentryx@gmx.de>
Cc: reiserfs-list@namesys.com

Andreas Sch=E4fer wrote:

>On 23:14 Tue 14 Mar     , Hans Reiser wrote:
> =20
>
>>I generally believe that the per 4k
>>approach used throughout the linux kernel is not as CPU efficient as
>>sending larger groups of pages through the layers all at once.  In other
>>words, there is a reason we have bios, and we need to learn the lesson
>>from them that they teach us, and abstract it into a general design
>>approach.
>>   =20
>>
>
>This is a bit OT, but still: I think you're absolutely right there. This 4=
k=20
>approach causes funny thing even in completely different areas.=20
>
>I've recently been playing around with openMosix (transparent process=20
>migration between Linux hosts over the network) and there the write=20
>preformance is totally spoiled (>50% performance loss) just because=20
>copy_from_user is only called for 4k block when writing (and these=20
>requests then suffer from the high network latency).=20
> =20
>
Tell the mosix guys we would be willing to cooperate with them regarding
their problem.

>If larger blocks would be used, this performance flaw wouldn't exist at=20
>all... Just my 2 cents
>
>-Andreas
>
>
> =20
>

