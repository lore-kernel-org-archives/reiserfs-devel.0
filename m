From: =?ISO-8859-1?Q?Bo_Brant=E9n?= <bosse@acc.umu.se>
Subject: ReiserFs Windows driver updated
Date: Sat, 6 Sep 2008 00:09:30 +0200 (CEST)
Message-ID: <Pine.A41.4.64.0809060007120.864282@stalin.acc.umu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
To: reiserfs-devel@vger.kernel.org


Hello,

I have updated the ReiserFs Windows driver so that it works on the late=
st
versions of Windows like XP SP3, Vista 32-bit and Vista 64-bit, you can
download it here: http://www.acc.umu.se/~bosse/rfsd-0.25.zip

The rfsd driver was originally developed by Mark Piper based on Ext2fsd=
 by
Matt Wu and Romfsd by Bo Brant=E9n.

Known problems:
   - Some files misses the last block when reading data from them. At
     a test on the linux kernel source code that contains aproximatly
     24000 files, 10% or aproximatly 2400 files showed this problem.
   - In directory listings a few file names are put together so that
     a.c and b.c is listed as a.cb.c.
   - No write support yet.

Bo Branten

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
