From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Comparison of notail and notail,iicache(14)  2.4.19-pre7
Date: Fri, 26 Apr 2002 23:21:58 +0200
Message-ID: <3CC9C4F6.2090508@mb.tu-ilmenau.de>
References: <200204260657.32516.Dieter.Nuetzel@hamburg.de> <3CC93CF4.AEC9C69@yura.polnet.botik.ru> <200204261845.45178.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>, reiserfs-list <reiserfs-list@namesys.com>

On 04/26/2002 06:45 PM, Dieter N=FCtzel wrote:

> On Friday 26 April 2002 13:41, Yury Yu. Rupasov wrote:
>=20
>>Dieter N=FCtzel wrote:
>>
>>>Manuel Krause wrote:
>>>
>>>[-]
>>>
>>>>What's really unclear is the problem with my
>>>>failing Netscape files on the living iicache-mounted FS...
>>>>
>>>I had one outlier with iicache-new-13 here, too.
>>>
>>>/etc/cups/ppds.dat
>>>
>>>couldn't be accessed. I reported back but got no response.
>>>
>=20
> [-]
>=20
>>>Next thing could be linux-2.4.19p6-compound-speedup.patch.
>>>Any version for -pre7 ready?
>>>
>>This patch should work with linux-2.4.19-pre7 as well.
>>
>=20
> Yes, Yura.
> I tried it today and got one rejection with preempt+lock-break.
> fs/reiserfs/journal.c.rej
>=20
[-]
>=20
> Had that before but Chris and Oleg gave me advice.
> I tried it this way:
>=20
> /* lock the current transaction */
> inline static void lock_journal(struct super_block *p_s_sb) {
>   PROC_INFO_INC( p_s_sb, journal.lock_journal );
>   debug_lock_break(1);
>   conditional_schedule();
>   down(&SB_JOURNAL(p_s_sb)->j_lock);
> }
>=20
> /* unlock the current transaction */
> inline static void unlock_journal(struct super_block *p_s_sb) {
>   up(&SB_JOURNAL(p_s_sb)->j_lock);
> }
>=20
> But then it seems to be _NOT_ preempt (+lock-break) save.
> System lock up (nothing in the logs, SysRq key didn't work) during=20
> latencytest0.42-png write test. Read test worked.
>=20
> Thanks,
> 	Dieter
>=20
>=20

Mmh, I made this adjustment in the patch, too, since the first speedup=20
patches had been posted. I really don't know how serious this could be=20
in this code context.

I had random hard locks,too, but blamed it to my degenerating hardware=20
so far. Could anyone else advise on preempt+lock-break-awareness here?

The linux-2.4.19p6-compound-speedup.patch seems to be another measurable =

tick faster than Olegs first patchset. Maybe, I'll post some values on=20
my setup over the weekend. I've had one faster run so far but it locked=20
up without log hints... ;-))


Best regards,

Manuel


