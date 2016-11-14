From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 187561] Kernel Dump on Write-Access to when Kernel is compiled
 without Reiserfs-Extended-Attributes-Option
Date: Mon, 14 Nov 2016 10:57:30 +0000
Message-ID: <bug-187561-695-kmcnQP9s0o@https.bugzilla.kernel.org/>
References: <bug-187561-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-187561-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=187561

--- Comment #1 from Felix Wiedenroth <felix.wiedenroth@gmx.de> ---
When Kernel Dumps on Write-Access, this leads to a inconsistent File-System.
This can only be fixed by the reiserfs-fsck when the option --fix-fixable is
used and the filesystem is not mounted at all. 

Therefore you have to boot from CD or boot from another HDD when Root-Partition
is affected.

-- 
You are receiving this mail because:
You are the assignee for the bug.
