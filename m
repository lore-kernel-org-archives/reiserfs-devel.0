From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Stacktrace when reading the build-fs partition....
Date: Tue, 19 Dec 2006 05:48:50 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0612190538580.22257@sheep.housecafe.de>
References: <194f62550612180527x327195d1ta48fbba0d88f23f1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550612180527x327195d1ta48fbba0d88f23f1@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, 18 Dec 2006, Clemens Eisserer wrote:
> When reading some of the file on the partition that was rescued with
> --build-fs, I got a stacktrace two times.

So, it does only happen on the partition that was rescued with 
--build-fs, not on a fresh mkfs'ed partition?

> Dec 18 14:29:32 localhost kernel:
> Dec 18 14:29:32 localhost kernel: reiser4[kio_file(3006)]:
> dc_check_checksum
> (fs/reiser4/plugin/file/cryptcompress.c:996)[edward-156]:
> Dec 18 14:29:32 localhost kernel: WARNING: Bad disk cluster checksum
> -41760589, (should be 1098063193) Fsck?

might be tricky to set this up, but: would it be posssible to recreate 
the scenario withouth the cryptcompress plugin? i.e. 'mkfs.reiser4' a 
partition, 'reiser4fsck --build-fs' and see if it happens again?
If so, we could rule out that the "plugin" is responsible for this mess.

> Tainted: PF     VLI

...oh, and perhaps with an untained kernel too? And while we're at it: 
maybe CONFIG_REISER4_DEBUG {w|c}ould reveal even more details. But then 
again: I'm not a reiser-hacker, so I can't comment on these traces 
anyway :(

> Dec 18 14:29:32 localhost kernel: EFLAGS: 00010246   (2.6.19-rc4-mm1-default 
> #2)

Have you tried 2.6.20-rc1-mm1 yet?

my 0.02p...
Christian
-- 
BOFH excuse #102:

Power company testing new voltage spike (creation) equipment
