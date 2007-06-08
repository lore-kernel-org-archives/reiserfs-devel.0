From: "Hemmann, Volker Armin" <volker.armin.hemmann@tu-clausthal.de>
Subject: stupid end-user question about reiser4
Date: Fri, 8 Jun 2007 17:45:16 +0200
Message-ID: <200706081745.16699.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

Hi,

I am using reiser4 for a couple of weeks for /home and some other stuff=
 that I=20
backup regularly or not really care about.

Today I accidentally hit reset instead of the power button (I use the p=
ower=20
button to switch to a vt sometimes) and upon reboot I got the usual mes=
sages=20
about the reiserfs partitions,  but nothing from the reiser4's.

[  45.727197] reiser4: sda5: found disk format 4.0.0.
[   51.014021] reiser4: sda6: found disk format 4.0.0.
[   52.317456] ReiserFS: sdb3: found reiserfs format "3.6" with standar=
d=20
journal
[   52.317465] ReiserFS: sdb3: using journaled data mode
[   52.345958] ReiserFS: sdb3: journal params: device sdb3, size 8192, =
journal=20
first block 18, max trans len 1024, max batch 900, max commit age 30, m=
ax=20
trans age 30
[   52.347407] ReiserFS: sdb3: checking transaction log (sdb3)
[   52.356272] ReiserFS: sdb3: replayed 1 transactions in 0 seconds
[   52.387631] ReiserFS: sdb3: Using r5 hash to sort names
[   52.416347] ReiserFS: sdb5: found reiserfs format "3.6" with standar=
d=20
journal
[   52.416357] ReiserFS: sdb5: using ordered data mode
[   52.428653] ReiserFS: sdb5: journal params: device sdb5, size 8192, =
journal=20
first block 18, max trans len 1024, max batch 900, max commit age 30, m=
ax=20
trans age 30
[   52.430128] ReiserFS: sdb5: checking transaction log (sdb5)
[   52.437570] ReiserFS: sdb5: replayed 1 transactions in 0 seconds
[   52.484026] ReiserFS: sdb5: Using r5 hash to sort names
[   52.517833] reiser4: sdb6: found disk format 4.0.0.

Is this normal behaviour of reiser4? to just mount silently and go on a=
s if=20
nothing happend? Or is there a bug in the init-scripts?
I haven't found anything about this in the documentation, so I am askin=
g here.=20
If this is explained somewhere, I would be very happy about a link.

Gl=FCck Auf
Volker
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
