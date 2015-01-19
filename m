From: <doiggl@velocitynet.com.au>
Subject: Why patch reiser4-for-3.17.3.patch does not apply ?
Date: Mon, 19 Jan 2015 17:52:28 +1100
Message-ID: <9cc275035b16b88c3bd4ada2aa9786f0@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
The reiser4-for-3.17.3.patch fails against linux-3.17.tar

[   94s] + cd linux-3.17
[   94s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[   94s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-3.17.3.patch
[   94s] 1 out of 1 hunk FAILED -- saving rejects to file
include/linux/mm.h.rej
[   94s] ++ echo '*** patch ../patches.rpmify/reiser4-for-3.17.3.patch
failed ***'
[   94s] *** patch ../patches.rpmify/reiser4-for-3.17.3.patch failed ***

project
https://build.opensuse.org/package/show/home:doiggl/kernel-vanilla

specfile
https://build.opensuse.org/package/view_file/home:doiggl/kernel-vanilla/kernel-vanilla.spec?expand=1

patches applied
https://build.opensuse.org/package/view_file/home:doiggl/kernel-vanilla/series.conf?expand=1

full build log
https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/x86_64/kernel-vanilla/_log

Question: Why patch reiser4-for-3.17.3.patch does not apply ?
--Glenn
