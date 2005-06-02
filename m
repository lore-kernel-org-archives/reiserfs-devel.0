From: Matthias Barremaecker <info@mh.be>
Subject: 13000Gig partition badblock check is the same -- do a reiserfsck
 again ?
Date: Thu, 02 Jun 2005 16:37:14 +0200
Message-ID: <429F199A.5020900@mh.be>
References: <1117392967.29669.ezmlm@namesys.com>            <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429C7E46.9090507@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

The first time, I did a bad block check, and feeded that list to the=20
reiserfsck --rebuild-tree.

The reiserfsck FAILED in phase 2.

Now I have done a bad block check again and the list is the same, so no=20
new bad blocks have occoured.

Is it sane to do the reiserfsck --rebuild-tree again, or will it fail again?

thanx.

kind regardes,

Matthias.
--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =80 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.

