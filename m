From: David Ellingsworth <david@identd.dyndns.org>
Subject: 2.6.30-rc5 reiserfs bug
Date: Fri, 15 May 2009 21:14:35 -0400
Message-ID: <30353c3d0905151814p7e0afb23y1b0f0e0acb35a41f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754675AbZEPBOr@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=odTBr+BHt9gnneD2Hq5EJVSRrJ1nTtAXjQQcuRQGb1w=;
        b=bxEWzCiZcxz/CZoGYuIqOf4g0yFtIF3MEoM4iR3SPwmNjgjzxqca+b+yqZBJownXLy
         jymGB700lJ+EFc7tDV6ndqpjEKQ7unpWVov6ONswJtu3QYy2hdlZ3rJrY4xi2LXXzyuN
         7n67qmy4YYRYctqdczjm4YLVca21uwF+JX0fY=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@veger.kernel.org, LKML <linux-kernel@vger.kernel.org>

I just built a kernel based off of the latest wireless-testing branch
and encountered this warning upon boot.

Regards,

David Ellingsworth

-------------------------------------------------------------------------------------

WARNING: at fs/namei.c:1251 warn_slowpath_null+0x10/0x15()
Hardware name: Presario 2100 (PF181UA)
Modules linked in: reiserfs ide_cd_mod ide_gd_mod cdrom
ide_pci_generic ohci_hcd alim15x3 ide_core natsemi usbcore thermal fan
Pid: 731, comm: exe Not tainted 2.6.30-rc5-wl #4
Call Trace:
 [<c0116690>] warn_slowpath_fmt+0x72/0xa1
 [<c0119da2>] ? __do_softirq+0xba/0xc2
 [<c0119e94>] ? irq_exit+0x28/0x2a
 [<c0103d00>] ? do_IRQ+0x5b/0x70
 [<c0102e29>] ? common_interrupt+0x29/0x30
 [<c0116f87>] ? vprintk+0x1fe/0x208
 [<dcd0b037>] ? prepare_error_buf+0x3e4/0x41e [reiserfs]
 [<c01166cf>] warn_slowpath_null+0x10/0x15
 [<c015cace>] lookup_one_len+0x30/0x9a
 [<dcd18596>] reiserfs_xattr_init+0x61/0x1af [reiserfs]
 [<dcd0a0f7>] reiserfs_fill_super+0xa8a/0xb98 [reiserfs]
 [<c0165fd1>] ? mntput_no_expire+0x19/0x97
 [<c01ad31c>] ? string+0x34/0x82
 [<c01addb3>] ? vsnprintf+0x65f/0x6a2
 [<c01ade5c>] ? snprintf+0x15/0x17
 [<c01851b1>] ? disk_name+0x5a/0x67
 [<c0157923>] get_sb_bdev+0xf2/0x138
 [<dcd08351>] get_super_block+0x13/0x15 [reiserfs]
 [<dcd0966d>] ? reiserfs_fill_super+0x0/0xb98 [reiserfs]
 [<c0156c42>] vfs_kern_mount+0x3c/0x77
 [<c0156cc1>] do_kern_mount+0x32/0xb9
 [<c0167410>] do_mount+0x5b5/0x5f3
 [<c0275e15>] ? iret_exc+0x4f9/0x9ab
 [<c01674af>] sys_mount+0x61/0x9a
 [<c0102875>] syscall_call+0x7/0xb
