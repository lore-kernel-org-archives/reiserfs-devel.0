From: Matthias Barremaecker <info@mh.be>
Subject: Re: 13000Gig partition badblock check is the same -- do a reiserfsck
 again ?
Date: Thu, 02 Jun 2005 17:16:36 +0200
Message-ID: <429F22D4.1040701@mh.be>
References: <1117392967.29669.ezmlm@namesys.com>            <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com> <429F199A.5020900@mh.be> <429F17A2.2070102@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429F17A2.2070102@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Dan Oglesby <doglesby@teleformix.com>
Cc: reiserfs-list@namesys.com

Hi Dan,

I'm glad you have your data back and just lost 2 files. It gives me a=20
bit of ... hope :))

The error I've got was :
--------------------------------------------
2 directory entries were hashed with not set hash.
  731305 directory entries were hashed with "r5" hash.
           "r5" hash is selected
  Flushing..finished
           Read blocks (but not data blocks) 313507947
                   Leaves among those 439626
                           - corrected leaves 46
                           - leaves all contents of which could not be
  saved and deleted 56
                   pointers in indirect items to wrong area 3997 (zeroed)
                   Objectids found 731997

  Pass 1 (will try to insert 439570 leaves):
  ####### Pass 1 #######
  Looking for allocable blocks .. finished
  0%....20%....40%pass1.c 212 balance_condition_2_fails
  balance_condition_2_fails: block 1288402, pointer 168: The left
  delimiting key [1412453424 1412453424 0x10001000 ??? (15)] of the block
  (170046457) is wrong,the item cannot be found
--------------------------------------------

What just doens't make any sens to me.

I'm using version  3.6.19.

If you have any ideas ...

Thanx.

kind regardes,


Matthias.




Dan Oglesby wrote:
 > Matthias Barremaecker wrote:
 >
 >> Hi,
 >>
 >> The first time, I did a bad block check, and feeded that list to the
 >> reiserfsck --rebuild-tree.
 >>
 >> The reiserfsck FAILED in phase 2.
 >>
 >> Now I have done a bad block check again and the list is the same, so
 >> no new bad blocks have occoured.
 >>
 >> Is it sane to do the reiserfsck --rebuild-tree again, or will it fail
 >> again?
 >>
 >> thanx.
 >>
 >> kind regardes,
 >>
 >> Matthias.
 >
 >
 >
 > What error did you get?  Same as before?
 >
 > FWIW, I was able to successfully recover my corrupted array!  Had to
 > update all hardware to latest BIOS/Firmware, all software and drivers to
 > latest versions.  Took two days to run, but it completed, and I ended up
 > only losing 2 files out of over 1.1 million files on a 1TB RAID-5
 > array.  That's not too bad, considering how many times the machine went
 > up and down due to bad power in the building.
 >
 > --Dan
 >
 >

--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =80 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.


Dan Oglesby wrote:
> Matthias Barremaecker wrote:
>=20
>> Hi,
>>
>> The first time, I did a bad block check, and feeded that list to the=20
>> reiserfsck --rebuild-tree.
>>
>> The reiserfsck FAILED in phase 2.
>>
>> Now I have done a bad block check again and the list is the same, so=20
>> no new bad blocks have occoured.
>>
>> Is it sane to do the reiserfsck --rebuild-tree again, or will it fail=20
>> again?
>>
>> thanx.
>>
>> kind regardes,
>>
>> Matthias.
>=20
>=20
>=20
> What error did you get?  Same as before?
>=20
> FWIW, I was able to successfully recover my corrupted array!  Had to=20
> update all hardware to latest BIOS/Firmware, all software and drivers to =

> latest versions.  Took two days to run, but it completed, and I ended up =

> only losing 2 files out of over 1.1 million files on a 1TB RAID-5=20
> array.  That's not too bad, considering how many times the machine went=20
> up and down due to bad power in the building.
>=20
> --Dan
>=20
>=20

--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =80 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.

