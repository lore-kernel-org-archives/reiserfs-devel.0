From: Matthias Barremaecker <info@mh.be>
Subject: Re: Reiserfs 1300G partition on lvm problem ...
Date: Tue, 31 May 2005 16:14:43 +0200
Message-ID: <429C7153.8000008@mh.be>
References: <1117392967.29669.ezmlm@namesys.com>            <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429C6BE8.4090906@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Dan Oglesby <doglesby@teleformix.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

Hi Dan,

My recovery goes rather well...

Does the badblocks count or anything ? With me it counted.

You have to write the bad block no's to a file and feed that to the=20
reiserfschk.

I didn't completed a full badblock check coz I knew the badblocks could=20
only be at the beginning of the lvm 'array', but I excpect it to take as=20
long as a reiserfsck --tree-rebuild.

If you don't see anything counting -- start worrying.

Good luck to you to.

I have still 18 hours to go... I realy hope I can mount the dam thing=20
after that and then I can start looking for the bad disk.

And I'm not using any type of raid for that data.

kind regardes,

Matthias.

Dan Oglesby wrote:
> Matthias Barremaecker wrote:
>=20
>> Hi,
>>
>> Thanx for your reply.
>>
>> The data is not THAT importend, all our importend data is backuped 4=20
>> times, inc. original (well, 3 times now, since the 1300gig machine is=20
>> broke).
>>
>> I did a bit furtur reasearch and maybe this is something to think=20
>> about if you use reiserfs :
>>
>> I did a bad block check and I have 10 bad blocks of 4096bytes on=20
>> 1300Gig and ... that is the reason reiserfs will not work anymore.
>>
>> I guess this sux. I rather have that the data on the bad blocks is=20
>> just corupted but the rest is accesseble.
>>
>> I'm doing a --rebuild-tree with the bad block list. Hopes this works.
>>
>>
>> Aren't there any tools to substract data from a broken reiserfs=20
>> partition ?
>>
>>
>> kind regardes,
>>
>> Matthias.
>>
>>
>>
>=20
>=20
> I'm currently in a similar situation:  1TB (RAID-5) ReiserFS filesystem=20
> running on RedHat 7.2 with a Promise SX6000 controller.  Everything was=20
> running stock version/firmware/BIOS, and it suddently developed 39 bad=20
> blocks after a power outage.
>=20
> reiserfsck --rebuild-tree (version 3.6.4, the latest for RH 7.2) failed=20
> to complete after the controller kept hard locking/crashing.
>=20
> So, I've compiled a plain 2.4.30 kernel (from kernel.org, not RedHat),=20
> updated the BIOS/Firmware on the SX6000, and compiled and installed the=20
> latest reiserfsprogs (3.6.19, I believe?), and have been running=20
> badblocks (non-destructive) for the last four days.  Nothing has turned=20
> up so far.
>=20
> I'm hoping the next time I run a --rebuild-tree, it will be able to=20
> complete.  I really do need to get the data off of this filesystem.
>=20
> Good luck with your recovery.
>=20
> --Dan
>=20
>=20
>=20
>=20
>> Valdis.Kletnieks@vt.edu wrote:
>>
>>> On Sun, 29 May 2005 21:25:54 +0200, Matthias Barremaecker said:
>>>
>>>
>>>> but that sais it is a fysical drive error
>>>
>>>
>>>
>>>
>>> Physical drive errors.  Your hardware is broken.  Isn't much that=20
>>> Reiserfs
>>> can do about it.
>>>
>>>
>>>> What can I do.
>>>
>>>
>>>
>>>
>>> 1) Call whoever you get hardware support from.
>>>
>>> 2) Be ready to restore from backups.
>>>
>>> 3) If you didn't have RAID-5 (or similar) set up, or a good backup,=20
>>> consider
>>> it a learning experience.
>>>
>>> If your data is important enough that you'll care if you lose it, you=20
>>> should take
>>> steps to make sure you won't lose it... It's that simple.
>>>
>>> (Just for the record, if we have important info, it gets at least=20
>>> RAID5, a
>>> backup to tape or other device, *and* a *second* backup off-site. =20
>>> And my shop
>>> is far from the most paranoid about such things.)
>>>
>>
>=20
>=20
>=20

--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =80 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.

