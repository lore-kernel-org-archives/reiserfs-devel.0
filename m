From: Hans Reiser <reiser@namesys.com>
Subject: Re: Performance improvements to key comparison functions
Date: Tue, 13 Jul 2004 11:19:23 -0700
Message-ID: <40F427AB.10301@namesys.com>
References: <16626.61112.905268.684688@laputa.namesys.com> <20040712204952.C0C3A1617F@mail03.powweb.com> <20040712210705.GZ4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040712210705.GZ4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Dabbs <david@dabbs.net>, 'Nikita Danilov' <Nikita@Clusterfs.COM>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Mon, Jul 12, 2004 at 03:49:25PM -0500, David Dabbs wrote:
> =20
>
>>Is bonnie++ the recommended stress tool, or is there a reiser4 stress
>>utility?
>>   =20
>>
>
>bonnie++ and slow.c are what one usually sees flying around.
>
>fs stress or somesuch is also sometimes used, but it supposedly fragments
>Reiser4 quite a bit and afaik there's no way to defrag yet?
>Or does fsck do it, as I've gathered that some other variants do?
>
>Anyway, if someone has something more cpu-intensive than bonnie++ to offer,
>I'd also like to know about it, as bonnie++ uses a fair share of cpu
>on my machine.
>
> =20
>
If bonnie++ is sync bound, then it it completely inappropriate for=20
reiser4 testing.
