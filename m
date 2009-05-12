From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: 2.6.30-rc5: reiserfs is broken on parisc (bisected)
Date: Tue, 12 May 2009 20:40:20 +0400
Message-ID: <a4423d670905120940r5de3eab7v7e8e92d89107b962__2506.54084743491$1242146438$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=UNV5OhG8idiTn44oDyt0RDs7h+9rpEzDVyvQQYZM7vw=;
        b=R+pe9HvmypCByq2F/MtyPFWuYhygqdFUixiNl46x2itbsTgItIYTC5hOa49+lY3q/G
         2Lds/QWC2LNjRGBN/dXw5hs5NhSYVm8Q7zoFIRPmm++YUp3KMYkkOWJgGqFrSbTc24CN
         IrWzB23OQlrFxvjIsNz+I9WoOgblH0l73NYus=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, linux-parisc@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Al Viro <v>

Hi

ab17c4f02156c4f75d7fa43a5aa2a7f942d47201 is the first bad commit
(reiserfs: fixup xattr_root caching)

Kernel panics when init tries to remount rootfs (reiserfs) with
read-write access.
Read-only access works fine.

No more messages on the screen before panic.

Is it endianess related?
