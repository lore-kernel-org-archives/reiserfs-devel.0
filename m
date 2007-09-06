From: "Marti Raudsepp" <marti@juffo.org>
Subject: ReiserFS: clm-2100: nesting info a different FS
Date: Thu, 6 Sep 2007 17:31:53 +0300
Message-ID: <2a12af650709060731m64d7ff9es7f702d5c300cfcc2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=ojJ0oROWbbmu6ddY4AtBB9AyW3kmXoWBHsqL0025ZCU=;
        b=Kds1pEjjYWRkkHjnsdN34am9JtYoT4OL9CmL8/r2cmRr12GKPW4kjzJ3oRM22y0G6hA9tHgjtmRU27HoocgiaDGInZL2pb/MvfDOPH98scxs+4+nzIu4Ha6As6xPKJudhjL0D61xmlgwdplTzZCdh8bRnHYImw+2vhRTeiCgiAw=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, fsdevel <linux-fsdevel@vger.kernel.org>

Hi,

My dmesg output contains a lot of warning messages from reiserfs and
I'm wondering if this is anything important:
ReiserFS: dm-0: warning: clm-2100: nesting info a different FS

I'm running Hardened Gentoo kernel 2.6.16-r11 on AMD64. I've got three
reiserfs filesystems: one for root which is mounted directly from a
RAID1 array (/dev/md/2), and two are LVM volumes from another RAID1
array (/dev/md/3); one of the latter has usrquota enabled. I'm not
really sure which block device "dm-0" refers to. The computer is doing
relatively little disk I/O most of the time.

The comment in fs/reiserfs/journal.c says:
/* we've ended up with a handle from a different filesystem.
 ** save it and restore on journal_end.  This should never
 ** really happen...
 */

The "should never really happen" part made me wonder, is this anything
I should be worried about? Over the last 92 days, my dmesg contains
123 errors like this; 90 of those appeared on 3rd of September, the
rest are many days apart; there doesn't appear to be any correlation
with any messages in other log files. They appear to come in bursts of
spanning 0.4 or less milliseconds, and are sometimes followed by more
bursts a few seconds later.

There have been no apparent problems with the performance of the disks
or system as a result. According to Google searches, earlier kernels
exhibited this problem with quotas enabled, but that bug was fixed
back in 2.6.14. And nothing significant appears to have changed in
fs/reiserfs/journal.c from 2.6.16 till today.

Regards,
Marti Raudsepp
