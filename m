From: =?ISO-8859-1?Q?Xu=E2n_Baldauf?=
 <xuan--2004.08.01--reiserfs-list--namesys.com@baldauf.org>
Subject: Re: Where to put the journal
Date: Thu, 05 Aug 2004 19:05:21 +0200
Message-ID: <411268D1.7000101@baldauf.org>
References: <410CCFCA.1030309@baldauf.org> <410E08F7.9020303@namesys.com> <411262DC.4070206@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411262DC.4070206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

Edward Shishkin wrote:

> Vladimir V. Saveliev wrote:
>
>> Hello
>>
>> Xu=E2n Baldauf wrote:
>>
>>> Hello,
>>>
>>> I want to setup a Linux software RAID 5 over disks of different=20
>>> speed with reiserfs on top. I know that the journal has to be=20
>>> accessed frequently for comparably small accesses. That's why I'm=20
>>> considering to "offload" the journal onto an extra partition on a=20
>>> faster disk of the RAID set.
>>>
>>> Thus, the journal would not be protected by the RAID, but this is=20
>>> not so important for me.
>>>
>>> Is this kind of reasoning sane? Would there be any speedup by=20
>>> offloading the journal?
>>>
>>
>
> Hello.
> Unfortunately comprehensive results of journal relocation are obsolete
> as it was done at the beginning of mongo evolution. As I remember there
> were no any essential speedups. The only result of  journal =20
> relocation that
> was created by new mongo benchmark can be found here:
> http://thebsh.namesys.com/benchmarks/journal_relocation_to_NVRAM.html

Thank you,

essentially, these numbers say that relocation provided a speedup of=20
about 10% for write. This surprises me a bit, because I expected a=20
significantly smaller seek count for a write operation. Nevertheless,=20
maybe I should run benchmarks with many small files for myself. :-)

>
> Edward.


ciao,

Xu=E2n Baldauf.

>
>> Person who did some tests on non standard journal is on vacation. He=20
>> is expected to come back today. Maybe he remembers benchmark results,
>

