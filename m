From: Hans Reiser <reiser@namesys.com>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 10:26:11 -0700
Message-ID: <4149CCB3.1030001@namesys.com>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org> <20040916153835.GK5137@backtop.namesys.com> <20040916155248.GM26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040916155248.GM26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Alex Zarochentsev <zam@namesys.com>, Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Thu, Sep 16, 2004 at 07:38:36PM +0400, Alex Zarochentsev wrote:
>
> =20
>
>>We are not going to add more intelligence to the in-kernel repacker modul=
e but
>>design an interface between repacker and user-space programs and implement
>>reisizing alg. in user-space.=20
>>   =20
>>
>
>This sounds a bit fishy; is it about having two repackers then?
>One in kernelspace and one in userspace?
>Will the kernelspace one be obsoleted?
> =20
>
The kernel will perform transactions requested by user space.  These=20
transactions will be composed by the user space program.

We will start with the simple algorithm we currently use, and then Zam=20
and I will go read Knuth and Woods and the web to seriously research=20
sorting algorithms which we haven't done yet.=20

>>>>unmergable units shouldn't be problem for the reiser4 kernel code.
>>>>       =20
>>>>
>>>What are their significance; what do they mean?
>>>     =20
>>>
>>two extent units (start1, len1), (start2, len2) can be merged into one (s=
tart1,
>>len1 + len2) because start1 + len1 =3D=3D start2.  I think no reiser4 ker=
nel code
>>depends on that mergable extents do not exist.
>>   =20
>>
>
>Unmergable units are then (start1 + len1) !=3D start2 because the repacker
>messed this up?=20
>
>The kernel finds the extent units from their "old places" without optimizi=
ng
>them to one unit?
>
> =20
>

