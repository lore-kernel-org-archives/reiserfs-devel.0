From: =?iso-8859-2?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: reiser4 crashes
Date: Thu, 29 Sep 2005 13:15:21 +0200
Message-ID: <003401c5c4e7$16ad41f0$0300a8c0@JUICE1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: reiserfs-list@namesys.com

> Hello
>
> Artur Mak=F3wka wrote:
>> Hello, my server crashed few times latetly, and the only strange thing i
>> found in logs, are reiser4 entries just before every crash:
>>
>> #1 crash:
>>
>> kern.log:Sep 27 21:09:06 werewolf kernel:
>> reiser4[pure-ftpd-mysql(18871)]: parse_node40
>> (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>> kern.log:Sep 27 21:09:06 werewolf kernel:
>> reiser4[pure-ftpd-mysql(18871)]: extent2tail
> ..
>> Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]:
>> parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
>> Sep 28 13:59:06 werewolf kernel: WARNING: Wrong level found in node: 1
>> !=3D 227
>> Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]:
>> extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
>> Sep 28 13:59:06 werewolf kernel: WARNING: Partial conversion of 4773593:
>> 0 of 1: -5
>> Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]:
>> release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
>> Sep 28 13:59:06 werewolf kernel: WARNING: Failed to convert in
>> release_unix_file (4773593)
>>
>>
>> this is quite traffic-heavy server (free hosting with lots of accounts)
>>
>> im using reiser4 , kernel 2.6.12.3 with 2.6.12 latest reiser4 patches,
>> reiser4progs 1.0.5, and its Debian.
>>
>> those entries i pasted logged like few minutes (or even less) before
>> every crash, and they happen other than these 'crashing' situations..
>>
>> can you help me?
>>
> I guess that your reiser4 filesystem is corrupted. You should fsck.reiser4
> it.

i'm doing it right now (with --build-fs option ) , but why it happend? i=20
really dont think its hardware
bug.

is it reiser4 bug?


