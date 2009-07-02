From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13037] reiserfs panic (device null superblock)
Date: Thu, 2 Jul 2009 15:00:58 GMT
Message-ID: <200907021500.n62F0wUL010466@demeter.kernel.org>
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





--- Comment #4 from Jeff Mahoney <jeffm@suse.com>  2009-07-02 15:00:56 ---
So the problem exists on 2.6.28.9 and not on 2.6.28? That's strange since the
only reiserfs change is this one:

--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2556,7 +2556,7 @@ static int reiserfs_write_begin(struct file *file,
        }

        index = pos >> PAGE_CACHE_SHIFT;
-       page = __grab_cache_page(mapping, index);
+       page = grab_cache_page_write_begin(mapping, index, flags);
        if (!page)
                return -ENOMEM;
        *pagep = page;

I'm surprised that reiserfsck doesn't come up with anything. This is a problem
where it's seeing an invalid bit on disk. Either that or memory corruption.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
