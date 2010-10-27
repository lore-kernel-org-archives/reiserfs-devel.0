From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 21092] Kernel 2.6.36 Bug during quotaon on reiserfs
Date: Wed, 27 Oct 2010 21:58:43 GMT
Message-ID: <201010272158.o9RLwhih026887@demeter2.kernel.org>
References: <bug-21092-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-21092-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=21092





--- Comment #2 from Jan Kara <jack@suse.cz>  2010-10-27 21:58:36 ---
Created an attachment (id=35292)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=35292)
Patch fixing locking in reiserfs_quota_on()

Could you please try whether this patch fixes the issue? Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
