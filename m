From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 17 May 2011 09:19:47 GMT
Message-ID: <201105170919.p4H9Jl4m006584@demeter1.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162





--- Comment #14 from Maximilian Decker <burbon04@gmx.de>  2011-05-17 09:19:42 ---
oh no, it just happened again - I should not have commended the 2.6.38.4 kernel
for being fine again with reiserfs :-/

The dm-crypted /home reiserfs - Partition is dead again, whereas the other
non-encrypted reiserfs partition on top of LVM2 is still accessible. Every
process trying to access /home gets stuck now. All the other mounted
filesystems (based on ext4, cifs) are ok.

There is nothing unusual in the logs oder dmesg (no debug patches or config
options were set in this kernel, however).

The crash happend while trying to save a screenshot, the "save as" dialog
opened but did not manage to show the folder contents. At that time the system
was quite loaded running several applications and virtual machines (but no
out-of-memory condition or whatsoever occured).

So, looks like there still is a serious issue with reiserfs on 2.6.38.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
