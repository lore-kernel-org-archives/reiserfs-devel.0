From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Thu, 12 Apr 2012 11:32:12 GMT
Message-ID: <201204121132.q3CBWCeG027088@bugzilla.kernel.org>
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





--- Comment #40 from Maximilian Decker <burbon04@gmx.de>  2012-04-12 11:32:10 ---
hi all,

I just wonder if there have been any news on this in the meanwhile... ?

As far as I'm concerned the problem did not occur anymore after upgrading to
openSuSE 12.1 (running kernel 3.1.x series) about half a year ago. I am still
using the same reiserfs (3.6) partitions for crypted /home (no acl) as well as
for a non-crypted /data (with acl). 
(in my case it was the non-acl mounted /home that happened to crash
sporadically)


- Maximilian

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
