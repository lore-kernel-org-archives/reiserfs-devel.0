From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Thu, 30 May 2013 21:54:10 +0000 (UTC)
Message-ID: <20130530215410.22A4911FB9C@bugzilla.kernel.org>
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





--- Comment #49 from Jeff Mahoney <jeffm@suse.com>  2013-05-30 21:54:09 ---
Created an attachment (id=103031)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=103031)
[PATCHSET] reiserfs locking fixes

Here's a tarball containing patches and a series file that should fix
quota/write lock deadlocks as well as several other potential problem sites.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
