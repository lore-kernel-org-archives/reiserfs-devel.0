From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Comparison of notail and notail,iicache(14)  2.4.19-pre7
Date: Sat, 27 Apr 2002 00:56:53 +0200
Message-ID: <3CC9DB35.6010106@mb.tu-ilmenau.de>
References: <200204260657.32516.Dieter.Nuetzel@hamburg.de> <200204261845.45178.Dieter.Nuetzel@hamburg.de> <3CC9C4F6.2090508@mb.tu-ilmenau.de> <200204270000.50274.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>, "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>

On 04/27/2002 12:00 AM, Dieter N=FCtzel wrote:

> On Friday 26 April 2002 23:21, Manuel Krause wrote:
>=20
>>On 04/26/2002 06:45 PM, Dieter N=FCtzel wrote:
>>
>>>On Friday 26 April 2002 13:41, Yury Yu. Rupasov wrote:
>>>
>>>>Dieter N=FCtzel wrote:
>>>>
>>>>>Manuel Krause wrote:
>>>>>
>>>>>[-]
>>>>>
>=20
> [-]
>=20
>=20
>>>Had that before but Chris and Oleg gave me advice.
>>>I tried it this way:
>>>
>>>/* lock the current transaction */
>>>inline static void lock_journal(struct super_block *p_s_sb) {
>>>  PROC_INFO_INC( p_s_sb, journal.lock_journal );
>>>  debug_lock_break(1);
>>>  conditional_schedule();
>>>  down(&SB_JOURNAL(p_s_sb)->j_lock);
>>>}
>>>
>>>/* unlock the current transaction */
>>>inline static void unlock_journal(struct super_block *p_s_sb) {
>>>  up(&SB_JOURNAL(p_s_sb)->j_lock);
>>>}
>>>
>>>But then it seems to be _NOT_ preempt (+lock-break) save.
>>>System lock up (nothing in the logs, SysRq key didn't work) during
>>>latencytest0.42-png write test. Read test worked.
>>>
>>>Thanks,
>>>	Dieter
>>>
>>Mmh, I made this adjustment in the patch, too, since the first speedup
>>patches had been posted. I really don't know how serious this could be
>>in this code context.
>>
>>I had random hard locks,too, but blamed it to my degenerating hardware
>>so far.
>>
>=20
> I think it is hardly hardware related.
> Try without lock-break (only disable it during make xconfig).


I should, if it helped for you. I've lost too much work time inbetween=20
for now.

>=20
>=20
>>Could anyone else advise on preempt+lock-break-awareness here?
>>
>=20
> Yura, Chris, Oleg or at least Robert Love :-)
> But Robert hasn't updated the lock-break stuff for some time. He will d=
o it=20
> soon.
>=20


Yepp. I observed this fact and hope Robert to do so.

>=20
>>The linux-2.4.19p6-compound-speedup.patch seems to be another measurabl=
e
>>tick faster than Olegs first patchset. Maybe, I'll post some values on
>>my setup over the weekend. I've had one faster run so far but it locked=

>>up without log hints... ;-))
>>
>=20
> Ha, ha,...:-)
>=20
> Then I have one more for you:
>=20
> Page coloring patch.
> It gave ~10% speedup on my 1 GHz Athlon II SlotA (0,18=B5m, L2 512K) fo=
r memory=20
> intensive apps. But be aware, it locks up randomly. The maintainer is l=
ooking=20
> for SMP testers 'cause it has something to-do with SMP -> preemption.
> My system is stable but lockup from time to time with the page_color mo=
dule=20
> loaded during "heavy" C and C++ compilations (~40 processes running in =

> parallel).


If I read this correctly I should leave my fingers from it...
Did I make a general mistake? Preempt+ does bring valuable advantages to =

my PIII 933 _uniprocessor_ setup, too.

>=20
> Have a nice weekend.
>=20
> -Dieter
>=20
> BTW I'm working on Win VFAT disk recovery. Two damaged IBM IC35L060AVER=
07-0=20
> costomer disks. One with only a single partition and one with three=20
> partitions. Any advice if I should try with dd on the whole disk or eve=
ry=20
> partition?
>=20
>=20

Maybe we should exchange our actual hdparm and powertweak settings in=20
private via phone soon? ;-)

On my current setup I have higher disk troughput rates on small=20
partitions (<0.5GB) but dropoffs in the middle of larger ones (~2GB) if=20
I trust the ksysguard display. I simply do "dd if=3D/dev/hda3 bs=3D1M=20
of=3D/dev/hdd3" after earlier timeless fiddling with bs=3Dxyz and=20
xyz~disk-cylinder-size(=3D16065 * 512 bytes)*2^(?)  did not give=20
advantages in the past. I did not do complete disk dd-s so far but had=20
many at the end of a dd with the current patch setup and partitions=20
 >0.3GB with the conventional bdflush and disk read/write-latency=20
parameters. Find your poison!

Have a nice weekend, too! And thanks for your comments, Dieter!

Manuel

