From: Matthias Barremaecker <info@mh.be>
Subject: Reiserfsck 1300Gig failed with following error
Date: Wed, 01 Jun 2005 08:47:50 +0200
Message-ID: <429D5A16.5030701@mh.be>
References: <1117392967.29669.ezmlm@namesys.com>            <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429C7E46.9090507@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Dan Oglesby <doglesby@teleformix.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

Hi,

using reiserfsprogs-3.6.19

Here is the error and messages : ...


2 directory entries were hashed with not set hash.
731305 directory entries were hashed with "r5" hash.
         "r5" hash is selected
Flushing..finished
         Read blocks (but not data blocks) 313507947
                 Leaves among those 439626
                         - corrected leaves 46
                         - leaves all contents of which could not be=20
saved and deleted 56
                 pointers in indirect items to wrong area 3997 (zeroed)
                 Objectids found 731997

Pass 1 (will try to insert 439570 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%pass1.c 212 balance_condition_2_fails
balance_condition_2_fails: block 1288402, pointer 168: The left=20
delimiting key [1412453424 1412453424 0x10001000 ??? (15)] of the block=20
(170046457) is wrong,the item cannot be found
Aborted


Anyone any suggestions ?

thanx!

kind regardes,


Matthias.


--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =80 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.

