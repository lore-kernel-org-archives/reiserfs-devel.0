From: Hans Reiser <reiser@namesys.com>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 19:29:27 -0700
Message-ID: <414A4C07.8060802@namesys.com>
References: <4148BC0E.5010509@willsmith.org> <20040916085248.GI5137@backtop.namesys.com> <20040916130809.GI26192@nysv.org> <20040916153835.GK5137@backtop.namesys.com> <20040916155248.GM26192@nysv.org> <20040916183831.GL5137@backtop.namesys.com> <20040916190019.GN26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040916190019.GN26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Alex Zarochentsev <zam@namesys.com>, Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Thu, Sep 16, 2004 at 10:38:31PM +0400, Alex Zarochentsev wrote:
> =20
>
>>on-line defragmenter requires its part to be in kernel space. at least no=
de
>>locks cannot be exported _safely_ to the user space, I think.
>>   =20
>>
>
>What if it was like=20
>echo -n "Killer Algo by Zam" > /sys/fs/reiser4/hda1/repacker/algorithm
>or something to get rid of the risk of having two really separate
>mechanisms, and if it can't be in userspace either way...
>
>This is also probably related to what Nik said back in the days about
>an online-fsck being impossible :)
>
> =20
>
Online fsck is possible.  Will do it for SuSE for 200k.;-)

It is a very serious task.  I would not do it just for fun.  It is,=20
however, feasible.

Hans
