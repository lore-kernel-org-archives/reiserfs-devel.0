From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Tue, 25 Aug 2009 21:01:33 GMT
Message-ID: <200908252101.n7PL1XHs019270@demeter.kernel.org>
References: <bug-13536-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13536-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13536





--- Comment #27 from Roland Kletzing <devzero@web.de>  2009-08-25 21:01:32 ---
weird...

but as this is bugzilla for vanilla kernel and not suse kernel (which contains
suse patches) i would have taken kernel-vanilla... package from kotd.

mind trying that, too ?

regarding comment #23 - i`m a little bit unsure. now, what is the offending
mount option? atime, data=journal or both ?

if you`re unsure,too, please test again and post results of

noatime,data=journal 
noatime,data=ordered
atime,data=journal
atime,data=ordered


furthermore, contrary to vanilla kernel suse kernel has barrier=flush as
default in place. so i would also compare barrier=flush vs. barrier=none 

+config REISERFS_DEFAULTS_TO_BARRIERS_ENABLED
+       bool "Default to 'barrier=flush' in reiserfs"
+       depends on REISERFS_FS
+        help
+         Modern disk drives support write caches that can speed up writeback.
+         Some devices, in order to improve their performance statistics,
+         report that the write has been completed even when it has only
+         been committed to volatile cache memory. This can result in
+         severe corruption in the event of power loss.
+
+         The -o barrier option enables the file system to direct the block
+         layer to issue a barrier, which ensures that the cache has been
+         flushed before proceeding. This can produce some slowdown in
+         certain environments, but allows higher end storage arrays with
+         battery-backed caches to report completes writes sooner than
+         would be otherwise possible.
+
+         Without this option, disk write caches should be disabled if
+         you value data integrity over writeback performance.
+
+         If unsure, say N.
+

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
