From: Piotr Neuman <sikkh@wp.pl>
Subject: Issues with reiser4progs-0.4.20.tar.gz
Date: Thu, 25 Dec 2003 18:29:38 +0100
Message-ID: <200312251829.38567.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16402-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@Namesys.COM

I doesn't cleanly compile against libaal-0.4.15.tar.gz, patch (lame one ;) ):

diff -ru ../reiser4progs-0.4.20/libreiser4/libreiser4.c 
reiser4progs-0.4.20/libreiser4/libreiser4.c
--- ../reiser4progs-0.4.20/libreiser4/libreiser4.c      2003-12-23 
10:03:28.000000000 +0100
+++ reiser4progs-0.4.20/libreiser4/libreiser4.c 2003-12-24 16:50:34.000000000 
+0100
@@ -238,15 +238,15 @@
 #endif
 };

-/* Returns libreiser4 max supported interface version */
+/* Returns libreiser4 max supported interface version
 int libreiser4_max_interface_version(void) {
        return LIBREISER4_MAX_INTERFACE_VERSION;
-}
+}*/

-/* Returns libreiser4 min supported interface version */
+/* Returns libreiser4 min supported interface version
 int libreiser4_min_interface_version(void) {
        return LIBREISER4_MIN_INTERFACE_VERSION;
-}
+}*/

 /* Returns libreiser4 version */
 const char *libreiser4_version(void) {

Another trivial problem: there is also no manpage for copyfs - only cpfs ...

Another problem: reiser4 'dumps core' when the partition it's on is made 
smaller (using fdisk) - reiser v3.6 - refuses to mount such thing... When 
reiser4 is in such a way crashed, the filesystem cannot be unmounted cleanly 
anymore (even after restart, kernel hangs), though mount ... -o ro ... in 
fstab helps - I was able to recover data without any kernel oops-es :).

Yet another one - movie playback in mplayer sometimes seems jerky (nothing 
like that in reiserfs v3.6).

Reiserfs patched 2.6.0 kernel (reiser4-2003.12.23.all.diff.gz).

