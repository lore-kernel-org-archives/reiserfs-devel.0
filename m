From: <doiggl@velocitynet.com.au>
Subject: patching 3.14.1-2 failed
Date: Wed, 04 Jun 2014 20:41:06 +1000
Message-ID: <940d42aef4b4a166b699936e794861e4@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Does anyone know why reiser4 patch cannot be applied to 3.14.2 or higher.

Here is the order of patches applied

 + /home/abuild/rpmbuild/SOURCES/guards --default=0 base
[  121s] + sort -u
[  121s] + sed 's,.*/,,; s,\.ko$,,'
[  121s] + cd linux-3.14
[  121s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[  121s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-3.14.1.patch
[  121s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.14.1
[  121s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.14.1-2
[  121s] 1 out of 5 hunks FAILED -- saving rejects to file
fs/fs-writeback.c.rej
[  121s] ++ echo '*** patch ../patches.kernel.org/patch-3.14.1-2 failed
***'
[  121s] *** patch ../patches.kernel.org/patch-3.14.1-2 failed ***
[  121s] error: Bad exit status from /var/tmp/rpm-tmp.CL4Oae (%prep)

It compiles ok if I comment out patch-3.14.1-2 and higher.

My patching order is this,It works if I comment out the following.
        patches.rpmify/reiser4-for-3.14.1.patch
        patches.kernel.org/patch-3.14.1
        #patches.kernel.org/patch-3.14.1-2
        #patches.kernel.org/patch-3.14.2-3
        #patches.kernel.org/patch-3.14.3-4

Thought you would like to know.
https://build.opensuse.org/package/show/home:doiggl/kernel-reiser4
https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4/series.conf?expand=1
Cheers --Glenn
