From: "=?iso-8859-1?Q?Arve_Emil_Myr=E5s?=" <aem@datakompaniet.no>
Subject: Flushing journal to disk..
Date: Mon, 5 May 2003 10:40:54 +0200 (CEST)
Message-ID: <1307.192.168.1.114.1052124054.squirrel@mail.datakompaniet.no>
Reply-To: aem@datakompaniet.no
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi..
I'm making a setup for realtime backup/"network mirroring" Using LVM &
Reiserfs & DRBD.

my setup is like this:

BoxA:                             BoxB:

reiserfs (mnt on /data1)          .not mounted.   reiserfs (mnt on /data1)
drbd <----Gigabit Ethethernet---> drbd            lvm snapshot
  |                               lvm  ----------/
hardware raid (promise)           hardware raid (promise)

Where BoxA is the primary node and opens the drbd device RW.

The clue is that i want to make a lvm-snapshot of the device on BoxB and
thak e backup of this snapshot while the filesystem is running 24/7 on
BoxA.

I got everything working exept getting the reiserfs to flush its logs to
disk and lock the dev when i take the snapshot.

I guess this would not be hard putting into a (or two one for sync+flush
one for unlock?) simple program but unforunately I'm no coder so I would
be wery happy if someone could help me or at least point me in the right
direction.

-Arve Emil Myr=E5s
 NORWAY


