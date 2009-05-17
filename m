From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13122] reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
Date: Sun, 17 May 2009 20:35:30 GMT
Message-ID: <200905172035.n4HKZUKD002127@demeter.kernel.org>
References: <bug-13122-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13122-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13122





--- Comment #4 from Rafael J. Wysocki <rjw@sisk.pl>  2009-05-17 20:35:29 ---
On Sunday 17 May 2009, Linus Torvalds wrote:
> 
> On Sat, 16 May 2009, Rafael J. Wysocki wrote:
> >
> > The following bug entry is on the current list of known regressions
> > from 2.6.29.  Please verify if it still should be listed and let me know
> > (either way).
> > 
> > 
> > Bug-Entry	: http://bugzilla.kernel.org/show_bug.cgi?id=13122
> > Subject		: reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
> > Submitter	: Alexander Beregalov <a.beregalov@gmail.com>
> > Date		: 2009-04-16 19:23 (31 days old)
> > First-Bad-Commit: http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=d984561b326cd0fe0d1183d11b9b4fa1d011d21d
> > References	: http://marc.info/?l=linux-kernel&m=123990989515105&w=4
> > Handled-By	: Jeff Mahoney <jeffm@suse.com>
> > Patch		: http://lkml.org/lkml/2009/5/10/91
> 
> The fix should now be merged as b83674c0da6558e357c6b482ccf299eeea77d8ef 
> ("reiserfs: fixup perms when xattrs are disabled")

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.