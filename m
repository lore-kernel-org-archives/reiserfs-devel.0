From: Edward Shishkin <edward@namesys.com>
Subject: Re: Where to put the journal
Date: Thu, 05 Aug 2004 20:39:56 +0400
Message-ID: <411262DC.4070206@namesys.com>
References: <410CCFCA.1030309@baldauf.org> <410E08F7.9020303@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410E08F7.9020303@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Xu=E2n_Baldauf?= <xuan--2004.08.01--reiserfs-list--namesys.com@baldauf.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

Vladimir V. Saveliev wrote:

> Hello
>
> Xu=E2n Baldauf wrote:
>
>> Hello,
>>
>> I want to setup a Linux software RAID 5 over disks of different speed=20
>> with reiserfs on top. I know that the journal has to be accessed=20
>> frequently for comparably small accesses. That's why I'm considering=20
>> to "offload" the journal onto an extra partition on a faster disk of=20
>> the RAID set.
>>
>> Thus, the journal would not be protected by the RAID, but this is not=20
>> so important for me.
>>
>> Is this kind of reasoning sane? Would there be any speedup by=20
>> offloading the journal?
>>
>

Hello.
Unfortunately comprehensive results of journal relocation are obsolete
as it was done at the beginning of mongo evolution. As I remember there
were no any essential speedups. The only result of  journal  relocation that
was created by new mongo benchmark can be found here:
http://thebsh.namesys.com/benchmarks/journal_relocation_to_NVRAM.html

Edward.

> Person who did some tests on non standard journal is on vacation. He=20
> is expected to come back today. Maybe he remembers benchmark results,
>
>
>

