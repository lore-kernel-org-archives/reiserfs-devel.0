From: jose.r.r@metztli.com (Metztli Information Technology)
Subject: Reiser4 \(SFRN\) 4.0.2 and linux 4.14.x cold boot kernel hang frequency.
Date: Thu, 15 Feb 2018 02:17:38 -0800 (PST)
Message-ID: <20180215101738.9C9CB11C79C0@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1518689860; h=From: Date: Message-Id: To: Subject: Sender;
 bh=2h/6Mg1EpoqAD75f0abLCl/AdIfaL/ypLqAGz+B5pfU=; b=gTnGf/7kwzWp0xQhSPygjnNWG53/AqlRl82vYw1cyG+luXymxMPyqbWL1A4BBjme7gWrX3QO
 CASpfMKdOn4pVDvnEiCasNHv7vpbioOOou037WLvI2nR96EKMnU/ElPepphKXlOMWDllh6Xc
 dz0Mv3Epxa8NyO5d5/T7q6LpkU4=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Niltze, Ed-

I came across this (fixed) issue in ZFS which touches on Reiser4:

'Reiser4's maintainer decided to modify the kernel VFS to export the old function' [1]
https://github.com/zfsonlinux/zfs/pull/7021

I am currently running:

uname -a
Linux huitzilopochtli 4.14.0-3+reiser4.0.2-amd64 #1 SMP Debian 4.14.17-1+reiser4.0.2 (2018-01-16) x86_64 GNU/Linux

There are no Reiser4 related apparent operating issues as in this environment I have built GCC7 and VirtualBox 5.1.32  -- the latest that fully supports reiser4 format/create/installation as done with Metztli-Reiser4 Debian Stretch AMD64 netboot in virtual machines creation and software 'cold boots':
< https://metztli.it/blog/index.php/ixiptli/?disp=posts#item_143 >
< https://metztli.it/blog/index.php/ixiptli >

No virtual or physical data loss but after Linux 4.14.x reiser4-patched kernels I am experiencing more frequent cold boot kernel hangs in physical hardware (i.e., laptop scenarios) -- until finally kernel boots appropriately into userland XDM. [2]

I do not know if it is due to Zstd not appropriately being loaded initially for my particular transparent compression ~ 1.2Tb reiser4 SFRN 4.0.2 partition daily development machine.

For long running instances (including those with transparent compression) -- as in cloud and or remote hosting instances the issue is, of course, less prevalent as I only reboot kernels sporadically.

Just wondering if [1] might have any relevance to [2] ?

Of course, FYI, Ed.


Best professional Regards.

P.S. I will provide more detailed information as I am able to capture it from booting kernel.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 4.14 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
