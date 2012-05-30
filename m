From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13037] reiserfs panic (device null superblock)
Date: Wed, 30 May 2012 15:16:29 +0000 (UTC)
Message-ID: <20120530151629.410E111FD1C@bugzilla.kernel.org>
References: <bug-13037-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13037-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=13037


Alan <alan@lxorguk.ukuu.org.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alan@lxorguk.ukuu.org.uk
     Kernel Version|2.6.28.9                    |2.6.34




--- Comment #11 from Pawel Zawora <pzawora@gmail.com>  2010-05-10 10:19:58 ---
I can confirm that:
1. reiser over local hard disk works stable,
2. is possible to reproduce problem using internal journaling.

Problem appears in that case:
NFS(v3) ---> resier ----> storage "depends on network" (DRBD/iSCSI). 

My environment:
multiple (4+) nfs clients(noacl,udp) [multiple simultaneous file access on the
same time] uses failover nfs server . NFS works over DRBD (active/passive ;
async protocol). DRBD uses dedicated network connection. "panic time" is depend
on load.

NFS server works stable with kernel <= 2.6.25 and new kernel with ie XFS
(always over DRBD)

Additonally, on the same cluster - when I try switch nodes - stopping nfsd
causes bug reported as 14055.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
