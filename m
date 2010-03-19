From: Luciano <luciano@joublanc.com>
Subject: R4 2.6.33 inconsistent keys
Date: Fri, 19 Mar 2010 15:52:31 +0000
Message-ID: <e4cc97d91003190852r374b43d5j5838a12eca1eec08@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:from:date
         :x-google-sender-auth:message-id:subject:to:content-type;
        bh=TxZuVmo1jRMz7LU8Xsxkbe8rebIfyUvX+piEiHNVr2Y=;
        b=hu91cIT5wBKwswq9FUvU0dOulqD8Zv14JkjfwduNUpMIQqcLFDgHvkHEGumOOS9Dz5
         mWqWpKjemvWCzZTLjS7nw/Kt6nNgHcpgmlCgFAisgDwUorKRsgoQfc0v0/DdbG7XepQe
         KONNjVEUe/7zhOPS2DT4MnHEPIqQ7NYfcFyzY=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

First, thanks for this great filesystem. Been using it for years
without probs, so I hope it gets integrated into the mainline soon.

However, I'm having some problems after upgrading from kernel 2.6.31.6
to 2.6.33. This is a 64 bit gentoo-patched kernel (just patches for
stability, I believe - no new features), with the reiser4 patches from
Edward's site. It's happened to me twice now that my X session locks
up and I see the following in my logs:

Mar 19 15:05:23 [kernel] WARNING: Keys are inconsistent. Fsck?
Mar 19 15:05:23 [kernel] reiser4[gconfd-2(6033)]: cbk_level_lookup
(fs/reiser4/search.c:963)[vs-3533]:

The previous time it happened the messages were similar but the
process was 'firefox' instead of gconfd.

When this happens it quickly fills up the logs and old ones are
overwritten; so I'm never able to get initial messages that may help
diagnose the problem. I have the full set of logs if you are
interested, but it just repeats the same message over and over.

After this, I can only cold boot, and the filesystem refuses to mount,
but I'm able to fix it with fsck. It complains about 'delimiting' keys
being zero. I fix this with the relevant fsck switch and as far as I
can tell there is no permanent damage to my files.

Finally I should mention that I also have a R4 root partition but that
hasn't had any problems. This is only happening on my home partition.
I should also note that it's mounted over a LUKS device using
/dev/mapper. I don't know much about the way that works, but I think
it just treats it as a block device, so if the problem were there, it
would manifest itself in different ways in the R4 layer. The fact that
it's always setting the delimiting keys to zero makes me think it's an
R4 problem. But then again I don't know much about this so I could be
utterly wrong.

Please let me know if I can contribute in any way.
