From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 DOS
Date: Sun, 02 May 2004 12:39:12 -0700
Message-ID: <40954E60.9080606@namesys.com>
References: <200405021539.05907.mbuesch@freenet.de> <20040502183332.GR29226@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040502183332.GR29226@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Michael Buesch <mbuesch@freenet.de>, reiserfs-list@namesys.com, nikita@namesys.com

Markus T=F6rnqvist wrote:

>On Sun, May 02, 2004 at 03:38:47PM +0200, Michael Buesch wrote:
> =20
>
>>#!/bin/sh
>>mount -treiser4 /dev/hdX /mnt/reiser4
>>cd /mnt/reiser4
>>while `/bin/true`; do
>>	cd metas
>>done
>>   =20
>>
>
>Do I remember something of my own, or wasn't there some discussion about
>this?
>
>"Should meta files have meta files"
>
>I'd say this is a bug, meta files seem like they shouldn't have meta
>data, by definition.
> =20
>
Nikita....

>Is this going away in the next snapshot?
>
>What about the metas dir inheriting +x from it's parent DIRECTORY, and
>not necessarily parent FILE?
>
> =20
>

