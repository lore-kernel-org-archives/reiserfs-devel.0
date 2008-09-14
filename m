From: =?ISO-8859-1?Q?Bo_Brant=E9n?= <bosse@acc.umu.se>
Subject: rfsd 0.25.2 released
Date: Mon, 15 Sep 2008 00:47:20 +0200 (CEST)
Message-ID: <Pine.A41.4.64.0809150046320.475346@stalin.acc.umu.se>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


rfsd 0.25.2 has been released, download it here:
http://www.acc.umu.se/~bosse/rfsd-0.25.2.zip

As of this release there are no outstanding bugs, please report any
problems to me.

Changed since last release:
Fixed the two read bugs. (One of them was releated to the tail of a file,
when tail packing is enabled in ReiserFS, witch is the default, the last
part of the file is stored as one or two direct items and the driver
didn't read the second one. The other bug was in RfsdReadInode() and
caused an error in some cases and inefficiency in most cases)
Changed some DbgPrint() and DbgBreakPoint() so they are only included in
the debug version of the driver.

Bo Branten

