From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: Data-logging and md as / fs bug
Date: Fri, 09 May 2003 22:21:19 +0200
Message-ID: <3EBC0DBF.4050807@netscape.net>
References: <3EB30852.6090402@netscape.net>	 <200305062134.42520.christian.mayrhuber@gmx.net>	 <1052250298.14612.235.camel@tiny.suse.com>	 <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>
Cc: Chris Mason <mason@suse.com>

Thanks for your description below about what is really useful... :-))

On 02/23/03 you posted a kinoded-9.diff.gz to the list that solved a=20
"device busy" on here when umounting a partition directly after copying=20
some GB data to it.
In those days you proposed to also use kinoded when not having the quota=20
patches applied. (That were the times when dirty-inodes-for-kinoded.diff
was new.)

My questions:
Is kinoded really useless without quota?
Did you discontinue the kinoded-9 changes?
Does it conflict with the recent data-logging changes?
And, I just read on the list that Kerin Millar wrote about=20
device/resource busy error messages and was wondering if that had=20
something to do with it.

Thanks,
  Manuel


On 05/08/2003 03:31 PM, Chris Mason wrote:
> On Tue, 2003-05-06 at 15:56, Dieter N=FCtzel wrote:
>=20
>>Am Dienstag, 6. Mai 2003 21:44 schrieb Chris Mason:
>>
>>>On Tue, 2003-05-06 at 15:34, Christian Mayrhuber wrote:
>>>
>>>>Hi,
>>>>
>>>>I've patched 2.4.21-rc1 with the following:
>>>
>>I have nearly the same running on-top of 2.4.21-pre6-jam1
>>
>>
>>>>02-akpm-b_journal_head-1.diff
>>>
>>Needed?
>>
>=20
>=20
> Yes
>=20
>=20
>>>>03-2.4.21-rc1-relocation-6.diff
>>>>04-reiserfs-sync_fs-1.diff
>>>>05-2.4.21-pre6-data-logging-36.diff
>>>>06-logging-export.diff
>>>
>>Needed?
>=20
>=20
> 06-logging-export is only needed if you want to compile reiserfs as a
> module
>=20
>=20
>>>>06-write_times.diff
>>>
>>I have -aa;-)
>>
>>
>>>>07-quota-v2-2.4.21.diff
>>>>08-2.4.21-pre6-reiserfs-quota-26.diff
>>>
>>Both not, yet.
>>
>>
>>>>09-kinoded-8.diff
>>>>10-reiserfs-quota-link-fix.diff
>>>
>>Needed?
>>
>=20
>=20
> Only if you are using quota
>=20
>=20
>>11.dirty-inodes-for-kinoded.diff
>=20
>=20
> This is flawed, since it does not include any way to throttle inode
> changes.  kinoded can't keep up with an active FS, and major changes are
> needed to fix that.  I've dropped it for now.
>=20
>=20
>>iget5_locked_for_2.4.21-pre5-datalogging.diff
>=20
>=20
> Not needed any more.
>=20
>=20
>>search_reada-4.diff
>>
>>Usefull?
>=20
>=20
> Good for desktop workload, needs additional changes for random io.
>=20
> -chris
>=20
>=20
>=20


