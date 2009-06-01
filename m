From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13374] reiserfs blocked for more than 120secs
Date: Mon, 1 Jun 2009 20:35:12 GMT
Message-ID: <200906012035.n51KZCuF020557@demeter.kernel.org>
References: <bug-13374-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13374-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13374





--- Comment #1 from Rafael J. Wysocki <rjw@sisk.pl>  2009-06-01 20:35:12 ---
On Sunday 31 May 2009, Frederic Weisbecker wrote:
> On Sat, May 30, 2009 at 09:37:36PM +0200, Rafael J. Wysocki wrote:
> > This message has been generated automatically as a part of a report
> > of recent regressions.
> > 
> > The following bug entry is on the current list of known regressions
> > from 2.6.29.  Please verify if it still should be listed and let me know
> > (either way).
> > 
> > 
> > Bug-Entry	: http://bugzilla.kernel.org/show_bug.cgi?id=13374
> > Subject		: reiserfs blocked for more than 120secs
> > Submitter	: Harald Dunkel <harald.dunkel@t-online.de>
> > Date		: 2009-05-23 8:52 (8 days old)
> > References	: http://marc.info/?l=linux-kernel&m=124306880410811&w=4
> > 
> 
> Trenton D. Adams has reported something very similar for -rc3:
> 
> http://lkml.org/lkml/2009/5/29/389
> 
> Someone holds the j_commit_mutex but never release it...

References : http://lkml.org/lkml/2009/5/29/389

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.