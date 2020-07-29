From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs RAID50 array.
Date: Wed, 29 Jul 2020 01:59:20 +0000
Message-ID: <bug-208719-695-OXJWG3NvlA@https.bugzilla.kernel.org/>
References: <bug-208719-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-208719-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208719

--- Comment #3 from deference@null.net ---
Thanks for your help!
I will forward this to the reiserfs maintainer.
I've managed to verify that all disks are accessible (smartctl -a /dev/sdX) and
that the RAID array is working and accessible (mdadm --detail and echo-ing
check/idle to the array and seeing progress).

-- 
You are receiving this mail because:
You are the assignee for the bug.
