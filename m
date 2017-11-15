From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: Reiser4 for 4.13.0/1 patches and transparent-compression
Date: Wed, 15 Nov 2017 02:40:06 -0800 (PST)
Message-ID: <20171115104006.DAFF9EBFEE5@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1510742409; h=From: Date: Message-Id: To: Subject: Sender;
 bh=u9QmsVwJkyZq5Y87gDrcP921/AgoDDans12ntTaP7hU=; b=QIwwyUNYeysnkk7bBWoZLvjJTYlulpqZfaYfQzaus3VuobV0n1+XmAFmFIxXnUCPbzOJfwLd
 MUYu+xaJmViJGUamV0JNVlqGB6lbULdu4SrIIfLh1xGnSyUzBQPG6efh97VT0e89UGc3Bemu
 fR9nIdJYDiyjOgymQez4Afx9X7g=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Niltze, Ed-

Here is some additional feedback on reiser4 transparent-compression:


Under Google Compute Engine (GCE) using resources: --custom-cpu=2 --custom-memory=4GB

Below dmesg lapse occurred while using VBoxManage (command line utility from headless VirtualBox 5.1.30) under latest reiser4-for-4.13.1.patch kernel
< https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-Linux-4.13.12-1_for-Stretch/ >
while converting a 2TB virtual machine into its disk.raw equivalent (11-14-2017): 

[..]
[  207.416756] reiser4: sda4: found disk format 4.0.1.
[  207.488274] reiser4: sda4: using Hybrid Transaction Model.
[  965.372697]  sdb: sdb1
[ 1020.422370] reiser4: sdb1: found disk format 4.0.1.
[ 1044.098194] reiser4: sdb1: using Hybrid Transaction Model.
[ 2256.307429] vboxdrv: loading out-of-tree module taints kernel.
[ 2256.314916] vboxdrv: Found 2 processor cores
[ 2256.333498] vboxdrv: TSC mode is Invariant, tentative frequency 2199993485 Hz
[ 2256.340792] vboxdrv: Successfully loaded version 5.1.30 (interface 0x002a0000)
[ 2265.565041] VBoxNetFlt: Successfully started.
[ 4898.939952] reiser4[ktxnmgrd:sdb1:r(12134)]: commit_current_atom (/usr/src/build/kernel/tekitl-4.13.12/linux/fs/reiser4/txnmgr.c:1052)[nikita-317
6]:
               WARNING: Flushing like mad: 16384

------------------------------------------------

Older:
with previous patch reiser4-for-4.13.0.patch.gz: logged neary 5k lines snapshot
 during heavy load (using VirtualBox 5.1.28/30, etc.) and other applications in my local machine.
 Had to reboot machine as there was no way to stop dmesg flow (Oct 22, 2017):


[24068.404896] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.404938] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.404950] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.404962] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.404974] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.404986] reiser4[DOMCacheThread(29961)]: checkout_logical_cluster (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/file/cryptcompress.c:1980)[edward-1430]:
               WARNING: alloc stream failed with ret=-12
[24068.404993] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.405005] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.405017] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24068.405028] reiser4[DOMCacheThread(29961)]: checkout_logical_cluster (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/file/cryptcompress.c:1980)[edward-1430]:
               WARNING: alloc stream failed with ret=-12
[24068.405035] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach

[...]
               WARNING: convert_ctail: nothing to attach
[24075.202165] reiser4[DOMCacheThread(29961)]: checkout_logical_cluster (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/file/cryptcompress.c:1980)[edward-1430]:
               WARNING: alloc stream failed with ret=-12
[24075.202187] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202216] reiser4[DOMCacheThread(29961)]: checkout_logical_cluster (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/file/cryptcompress.c:1980)[edward-1430]:
               WARNING: alloc stream failed with ret=-12
[24075.202239] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202258] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202288] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202309] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202339] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202360] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202391] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202412] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
               WARNING: convert_ctail: nothing to attach
[24075.202440] reiser4[DOMCacheThread(29961)]: checkout_logical_cluster (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/file/cryptcompress.c:1980)[edward-1430]:
               WARNING: alloc stream failed with ret=-12


Best Professional Regards.
