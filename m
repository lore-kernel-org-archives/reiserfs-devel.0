From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 21092] Kernel 2.6.36 Bug during quotaon on reiserfs
Date: Thu, 6 Jan 2011 15:39:28 GMT
Message-ID: <201101061539.p06FdSQq017986@demeter1.kernel.org>
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





--- Comment #6 from Rafael J. Wysocki <rjw@sisk.pl>  2011-01-06 15:39:25 ---
On Thursday, January 06, 2011, Jan Kara wrote:
>   Hi,
> 
> On Thu 30-12-10 00:21:21, Rafael J. Wysocki wrote:
> > This message has been generated automatically as a part of a report
> > of regressions introduced between 2.6.35 and 2.6.36.
> > 
> > The following bug entry is on the current list of known regressions
> > introduced between 2.6.35 and 2.6.36.  Please verify if it still should
> > be listed and let the tracking team know (either way).
> > 
>   As far as I know, the problem has been fixed by commit
> da905873effecd1c0166e578bc4b5006f041b18b in the end.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
