From: <doiggl@velocitynet.com.au>
Subject: Re: [PATCH] Prevent Oops when mounting forward-incompatible volumes.
Date: Sat, 17 Sep 2016 22:05:33 +1000
Message-ID: <9e2c36bdb12a3da6710de08ec49946f3@mail.velocitynet.com.au>
References: <1473092001-9402-1-git-send-email-edward.shishkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1473092001-9402-1-git-send-email-edward.shishkin@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello,
patch fails to apply to linux-4.7
http://www.spinics.net/lists/reiserfs-devel/msg05165.html

[1]reiser4-prevent-oops-when-mounting-forward-incompatible-volumes.patch 

-Whats missing ?
--Glenn


patch order
	patches.rpmify/reiser4-for-4.7.0.patch
	ppatches.rpmify/reiser4-prevent-oops-when-mounting-forward-incompatible-volumes.patch


From last build log:
https://build.opensuse.org/package/live_build_log/home:doiggl/kernel-vanilla/openSUSE_13.2/x86_64

[  246s] + cd linux-4.7
[  246s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[  246s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/lustre-lloop-dont-change-logical-size
[  246s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/i915-fix-build-error-with-werror
[  246s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-4.7.0.patch
[  246s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-prevent-oops-when-mounting-forward-incompatible-volumes.patch
[  246s] The text leading up to this was:
[  246s] --------------------------
[  246s] |#Prevent-Oops-when-mounting-forward-incompatible-volumes.patch
[  246s] |#http://www.spinics.net/lists/reiserfs-devel/msg05165.html
[  246s] |---
[  246s] | init_super.c | 2 +-
[  246s] | 1 file changed, 1 insertion(+), 1 deletion(-)
[  246s] |
[  246s] |diff --git a/init_super.c b/init_super.c
[  246s] |index bd1644b..fb37605 100644
[  246s] |--- a/init_super.c
[  246s] |+++ b/init_super.c
[  246s] --------------------------
[  246s] File to patch: 
[  246s] Skip this patch? [y] 
[  246s] 1 out of 1 hunk ignored
[  246s] ++ echo '*** patch
../patches.rpmify/reiser4-prevent-oops-when-mounting-forward-incompatible-volumes.patch
failed ***'
[  246s] *** patch
../patches.rpmify/reiser4-prevent-oops-when-mounting-forward-incompatible-volumes.patch
failed ***
[  246s] error: Bad exit status from /var/tmp/rpm-tmp.jaeLa6 (%prep)
[  246s] 
[  246s] 
[  246s] RPM build errors:
[  246s]     Bad exit status from /var/tmp/rpm-tmp.jaeLa6 (%prep)
[  246s] 

#[patch content]

# cat
/home/r4/patches-latest/reiser4-prevent-oops-when-mounting-forward-incompatible-volumes.patch
#Prevent-Oops-when-mounting-forward-incompatible-volumes.patch
#http://www.spinics.net/lists/reiserfs-devel/msg05165.html
---
 init_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init_super.c b/init_super.c
index bd1644b..fb37605 100644
--- a/init_super.c
+++ b/init_super.c
@@ -639,7 +639,7 @@ int reiser4_init_read_super(struct super_block *super,
int silent)
                }
 
                sbinfo->df_plug =
-                       disk_format_plugin_by_id(
+                       disk_format_plugin_by_unsafe_id(
                               
le16_to_cpu(get_unaligned(&master_sb->disk_plugin_id)));
                if (sbinfo->df_plug == NULL) {
                        if (!silent)
--
