From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 15805] reiserfs locking
Date: Sat, 10 Jul 2010 13:02:34 GMT
Message-ID: <201007101302.o6AD2Y8b025820@demeter.kernel.org>
References: <bug-15805-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-15805-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15805





--- Comment #2 from Rafael J. Wysocki <rjw@sisk.pl>  2010-07-10 13:02:31 ---
On Saturday, July 10, 2010, Frederic Weisbecker wrote:
> On Sat, Jul 10, 2010 at 02:33:24AM +0200, Rafael J. Wysocki wrote:
> > This message has been generated automatically as a part of a report
> > of regressions introduced between 2.6.33 and 2.6.34.
> > 
> > The following bug entry is on the current list of known regressions
> > introduced between 2.6.33 and 2.6.34.  Please verify if it still should
> > be listed and let the tracking team know (either way).
> > 
> > 
> > Bug-Entry	: http://bugzilla.kernel.org/show_bug.cgi?id=15805
> > Subject		: reiserfs locking
> > Submitter	: Alexander Beregalov <a.beregalov@gmail.com>
> > Date		: 2010-04-15 21:02 (86 days old)
> > Message-ID	: <t2ka4423d671004151402n7b2dc425mdc9c6bb9640d63fb@mail.gmail.com>
> > References	: http://marc.info/?l=linux-kernel&m=127136535323933&w=2
> > Handled-By	: Frederic Weisbecker <fweisbec@gmail.com>
> 
> 
> It's a duplicate of 16334. Or rather 16334 is a duplicate of this
> but the discussion about the issue was more developped in 16334.
> 
> Anyway this is not a regression (at least not recent) and the fix
> from Al is in the vfs tree in the for-next branch on commit
> 6c2bdaf089a3876226893fab00dd83596c465ad2
> "Fix reiserfs_file_release()"

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.