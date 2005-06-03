From: Matthias Barremaecker <info@mh.be>
Subject: Re: 13000Gig partition badblock check is the same -- do a reiserfsck
 again ? -> ran badblocks
Date: Fri, 03 Jun 2005 09:10:36 +0200
Message-ID: <42A0026C.2090302@mh.be>
References: <1117392967.29669.ezmlm@namesys.com> <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com> <429F199A.5020900@mh.be>            <429F17A2.2070102@teleformix.com> <200506022103.j52L3A9A012873@turing-police.cc.vt.edu> <429F7AFA.40503@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429F7AFA.40503@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Dan Oglesby <doglesby@teleformix.com>
Cc: reiserfs-list@namesys.com

Hi,

I've ran
   badblocks -v -b 4096 -o badblocks2 /dev/hyperspace/hyperspace1

It said :
   Checking blocks 0 to 322256896
   Checking for bad blocks (read-only test): done
   Pass completed, 312 bad blocks found.

the file contains
   36434712
   36434756
   36434757
   36448896
   36448916
   38853584
   38853616
   38854632
   38854635
   38854636

That aren't 312 numbers... Or am I seeing it wrong ?

thanx!!


Dan Oglesby wrote:
> Valdis.Kletnieks@vt.edu wrote:
>=20
>> On Thu, 02 Jun 2005 09:28:50 CDT, Dan Oglesby said:
>>
>>
>>> latest versions.  Took two days to run, but it completed, and I ended=20
>>> up only losing 2 files out of over 1.1 million files on a 1TB RAID-5=20
>>> array.  That's not too bad, considering how many times the machine=20
>>> went up and down due to bad power in the building.
>>
>>
>>
>> Buy a UPS. Now.  Even if it's just a big battery that will only keep you
>> running for 10 mins - at least that will give you enough time to do a=20
>> clean
>> shutdown -h rather than get stuff trashed.
>>
>> If you can't get money for it, just point at the lost-productivity costs
>> the *next* time the terabyte takes 2 days to recover.. and remind the=20
>> boss that
>> you could be down for 2 days every time the lights flicker.. ;)
>=20
>=20
> That's just it...  Bad power in the building was due to the building's=20
> UPS (big sucker, attached to a Cummins diesel generator) failing. That's =

> been fixed, so the power in the building is OK again.
>=20
> Previous to the UPS going down, this building hadn't lost power in many=20
> years.  We don't have to deal with this kind of problem very often.  ;-)
>=20
> I've been using the array, and it's going great.  ReiserFS proves to be=20
> robust, as long as the hardware, power, and software on the system are=20
> in good working order.
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

