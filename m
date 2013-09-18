From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 06:47:05 +0000
Message-ID: <52394C69.8060702@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com> <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com> <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so> <5238D17D.1080806@gmail.com> <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so> <523944D2.40409@gmail.com> <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=tVz5sTWmATmAPOWYJPQImLVdu1E3N66LdRVfo06AdD0=;
        b=EidmCbU7v3cGAN1B6ZAs0FYT7BNAfAi7zG9YRVk0CdBAcKYYnV6FM2dRx0YLZSg8iJ
         cujclAPH/xQTEVqc+36OIJeYy3vTRNPNyUalGvGO01pV9lRCp+mlG5uFdR7z5K26qt7J
         y3AV+9MU83cibLKv0J8k2QCZ4A9BeVfifYg1/XFlFkkN9Od3dX7xOcFe4ijiAI69q0TR
         psqbc5WhDKP4YUJgcvRKJfL1q0feW9NBI6HM455jtcwyY3zraW5luemoWIeuNepFOalh
         7ZbJmZQhmR/HU5U8WlTE5iuVlaZtLo9MHKyGFRX371JfZ1+SWi6ZzW8ApvCJKkbsEmJD
         wxZQ==
In-Reply-To: <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <m@thieu.so>
Cc: Evgeniy <iron.udjin@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org


On 3.12-rc1 branch I get the following errors:


fs/fs-writeback.c: In function 'generic_writeback_sb_inodes':
fs/fs-writeback.c:641:3: warning: passing argument 2 of
'__writeback_single_inode' from incompatible pointer type [enabled by
default]
   __writeback_single_inode(inode, &wbc);
   ^
fs/fs-writeback.c:414:1: note: expected 'struct writeback_control *' but
argument is of type 'struct writeback_control **'
 __writeback_single_inode(struct inode *inode, struct writeback_control
*wbc)

and

include/linux/dcache.h:104:25: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '.' token
 #define d_lock d_lockref.lock
                         ^
fs/reiser4/fsdata.h:192:19: note: in expansion of macro 'd_lock'
 extern spinlock_t d_lock


during compile.  Stops dead in it's tracks when linking fs/nfs/built-in.so

Is it a simple fix ?  Maybe I can edit a in the kernel tree?






On 09/18/13 06:20, Mathieu Belanger wrote:
> Yes, I have messed-up my git commands.
>
> Now you can pull the new branch (listed there
> https://github.com/DestroyFX/reiser4/branches )
>
> For "real" kernel 3.11-rc4, 3.11 and 3.12-rc1.
>
> I did not test the compilation on 3.11+, I just took the patch for
> 3.11-rc4 and applied on others one.
>

