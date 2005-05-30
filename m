From: Matthias Barremaecker <info@mh.be>
Subject: Re: Reiserfs 1300G partition on lvm problem ...
Date: Mon, 30 May 2005 08:17:00 +0200
Message-ID: <429AAFDC.4050208@mh.be>
References: <1117392967.29669.ezmlm@namesys.com>            <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505292137.j4TLbarw017197@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

Hi,

Thanx for your reply.

The data is not THAT importend, all our importend data is backuped 4=20
times, inc. original (well, 3 times now, since the 1300gig machine is=20
broke).

I did a bit furtur reasearch and maybe this is something to think about=20
if you use reiserfs :

I did a bad block check and I have 10 bad blocks of 4096bytes on 1300Gig=20
and ... that is the reason reiserfs will not work anymore.

I guess this sux. I rather have that the data on the bad blocks is just=20
corupted but the rest is accesseble.

I'm doing a --rebuild-tree with the bad block list. Hopes this works.


Aren't there any tools to substract data from a broken reiserfs partition ?


kind regardes,

Matthias.



Valdis.Kletnieks@vt.edu wrote:
> On Sun, 29 May 2005 21:25:54 +0200, Matthias Barremaecker said:
>=20
>=20
>>but that sais it is a fysical drive error
>=20
>=20
> Physical drive errors.  Your hardware is broken.  Isn't much that Reiserfs
> can do about it.
>=20
>=20
>>What can I do.
>=20
>=20
> 1) Call whoever you get hardware support from.
>=20
> 2) Be ready to restore from backups.
>=20
> 3) If you didn't have RAID-5 (or similar) set up, or a good backup, consi=
der
> it a learning experience.
>=20
> If your data is important enough that you'll care if you lose it, you sho=
uld take
> steps to make sure you won't lose it... It's that simple.
>=20
> (Just for the record, if we have important info, it gets at least RAID5, a
> backup to tape or other device, *and* a *second* backup off-site.  And my=
 shop
> is far from the most paranoid about such things.)
>=20

--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =80 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.

