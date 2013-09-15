From: Christopher Gentile <cnjgentile@gmail.com>
Subject: Reiser4 3.11x Testing
Date: Sun, 15 Sep 2013 01:53:08 +0000
Message-ID: <CABYXC3ZjpxAEfyHhfGJ6PRyg2_XoAvS9Ui7h=NBsqVFm1CtbFw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=fkz06muAKSvsfk4AlKfZ2kt2pzm/KOJasPwGUWZagak=;
        b=jTht60lL/sP6o90O9C+MPF8b40SKNlMKDAblBvplGl5spEcYDH0othLcx6Xxcu1Bvg
         kAyTqsuDZF5hzsIFxKW1ctlBdjELLZfxz1Mu+NTrm63caeE1tY9OnHGa2xJsmX/JDgJS
         lgCvIuWNSniE25V1lpAyHNa2h4eUI2+5/h7WD2vgbMyYtGJA1xxB4zJIbpnpydyMX8H3
         xxGbIddvou8KRltws9yaTh+3rIjbKME2R4m/7RGDI8X2bfx23ENnBCo5nWSbeJNarndn
         XmMSuoYkpcVE3xtsYZTSWCuy6E321eg9QBUXRC17OAus/pCJz7MzoyZp2GREVsGUVPsh
         upmg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello all,

Thank you for having me.

I received kindly from Ivan a copy of his Reiser4 enablement kernel
patch for 3.11.x kernels.  I am in testing as we speak on my rootfs
after backing up data and wanted to introduce myself.

I am not a developer, just a heavy Linux enthusiast/amateur kernel
hacker. I loved Reiser4 on 3.10.xx and earlier kernels and have been
awaiting the functionality in the 3.11 series.

I am here to be useful, post results, ask some questions, and do
testing for you.

I have a beefy system so I can test most scenarios in an x86_64 environment.

3 SSD arrays and on large 10TB SATA3 array on a Corei7 3930K hexacore
with 32GB of DDR3 quad-channel RAM.

Because of these specs I can test essentially whatever you like,
however not being a developer I don't know how except for the fact
that:

-I use Gentoo linux
-Gentoo (if you're not familiar) is a rolling source-based distro,
tons of small files, all compiled.  Lots of compression/decompression
going on access to small files, as wel as my own personal large files.

If you need benchmarks done, need any commands executed looking for a
rest result please just ask, it's the least I could do.

Currently I am running Reiser4 on root on sSD raid0, re-compiling my
entire world file (compiling 1500+ packages from extracted from
.xz,.gz,bz2 source tarballs). I am 500 packages into the compile
without a hitch thus far, using kernel stable 3.11.1 from kernel.org ,
patched with the BFS 442 CPU scheduler, the kernel-gcc4.8 patch to
enable "-march=native" kernel compilation, and the UKSM patch for
online memory deduplication.

If anybody needs testing on non-patched kernels, or with a specific
patch/kernel, please let me know. Storage is not an issue and
compilation is fast and thus not an issue.  All I ask is please let me
know when the new patches come up for Reiser4.

The Reiser4 patch was supposed to be included in the mailing list
thread as per Ivan's earlier message however there was an issue where
it didn't attach.  Per Ivan's request I have refrained from posting it
as an attachment until Edward has a chance to review it.

Best Regards,

Chris Gentile
