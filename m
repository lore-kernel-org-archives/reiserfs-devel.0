From: <doiggl@velocitynet.com.au>
Subject: Re: [PATCH] reiser4: fix up incorrect recalculation of maximal balance overhead
Date: Wed, 25 May 2016 20:03:23 +1000
Message-ID: <eadef126d86ee5bd4035a65e7174c23b@mail.velocitynet.com.au>
References: <6fcfefcb-7886-de2b-e19c-642f7de8587a@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <6fcfefcb-7886-de2b-e19c-642f7de8587a@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,

reiser4-max-balance-overhead-update-fixup.patch failed to apply to
linux-4.6.tar.xz

Is it needed as build failed ?
Thanks
--Glenn

From build log

[   44s] + '[' -e /home/abuild/rpmbuild/SOURCES/linux-4.6.tar.xz ']'
[   44s] + SYMBOLS=
[   44s] + test -e /home/abuild/rpmbuild/SOURCES/extra-symbols
[   44s] + cd /home/abuild/rpmbuild/BUILD
[   44s] + rm -rf kernel-vanilla-4.6.0
[   44s] + /usr/bin/mkdir -p kernel-vanilla-4.6.0
[   44s] + cd kernel-vanilla-4.6.0
[   44s] + /usr/bin/xz -dc /home/abuild/rpmbuild/SOURCES/linux-4.6.tar.xz
[   44s] + /bin/tar -xf -
[   58s] + STATUS=0
[   58s] + '[' 0 -ne 0 ']'
[   58s] + /bin/tar -xf -
.
.
[   58s] + /home/abuild/rpmbuild/SOURCES/guards --default=0 base
[   58s] + cd linux-4.6
[   58s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[   58s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/lustre-lloop-dont-change-logical-size
[   59s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/lightnvm-warning-fixes.patch
[   59s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/firmware-path
[   59s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/cloneconfig.diff
[   59s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-4.6.0.patch
[   59s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-max-balance-overhead-update-fixup.patch
[   59s] Reversed (or previously applied) patch detected!  Assume -R? [n] 
[   59s] Apply anyway? [n] 
[   59s] 2 out of 2 hunks ignored -- saving rejects to file
fs/reiser4/tree_mod.c.rej
[   59s] ++ echo '*** patch
../patches.rpmify/reiser4-max-balance-overhead-update-fixup.patch failed
***'
[   59s] *** patch
../patches.rpmify/reiser4-max-balance-overhead-update-fixup.patch failed
***
[   59s] error: Bad exit status from /var/tmp/rpm-tmp.ttJkpx (%prep)


