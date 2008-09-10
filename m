From: =?ISO-8859-1?Q?Bo_Brant=E9n?= <bosse@acc.umu.se>
Subject: rfsd 0.25.1 released
Date: Wed, 10 Sep 2008 02:03:53 +0200 (CEST)
Message-ID: <Pine.A41.4.64.0809100203340.884914@stalin.acc.umu.se>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


rfsd 0.25.1 has been released, download it here: 
http://www.acc.umu.se/~bosse/rfsd-0.25.1.zip

Changed since last release:
Fixed the directory listing bug. (This bug apeared when the caller
supplied buffer didn't fit all the information for a directory so that
more than one query directory call was needed, when processing the first
directory entry in the second (and consecutive) calls the filename length
was misscalculated since information on the directory entry before wasn't
saved between the calls)

Known problems:
- Some files misses the last block when reading data from them. At a test
on the linux kernel source code that contains aproximatly 24000 files,
10% or aproximatly 2400 files showed this problem, however if the file
system was mounted with the notail option while untaring the files on
Linux less than 1% or 108 files showed this problem.
- No write support yet.

Bo Branten

