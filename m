From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13037] reiserfs panic (device null superblock)
Date: Wed, 23 Sep 2009 16:39:41 GMT
Message-ID: <200909231639.n8NGdfWV028923@demeter.kernel.org>
References: <bug-13037-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13037-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13037





--- Comment #8 from Pawel Zawora <pzawora@gmail.com>  2009-09-23 16:39:39 ---
It seems that problem is related to external journaling and network device. I
was able to reproduce problem on iSCSI device (using external journaling).
Currently  I have to abandon external journaling: "standard" reiserfs works
over my drbd without any problem...

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
