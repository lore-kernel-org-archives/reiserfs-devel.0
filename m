From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13876] [x86_32, 2.6.30, reiserfs, reiser3, bug, regression]
 kernel oopsed while Sarg was running
Date: Mon, 23 Nov 2009 09:45:03 GMT
Message-ID: <200911230945.nAN9j38j026832@demeter.kernel.org>
References: <bug-13876-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13876-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13876


Igor M Podlesny <for.poige+bugzilla.kernel.org@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |CODE_FIX




--- Comment #9 from Igor M Podlesny <for.poige+bugzilla.kernel.org@gmail.com>  2009-11-23 09:44:59 ---
> Igor, can you try latest kernel

Roland, that comp. isn't mine; it has been running 2.6.27.something happily for
quite a long time now and its users are careless. I don't think it'd be a good
idea to tell'em "guys, kernel devs would like to give your box another crash
test, wouldn't ya mind, ugh?". :-)

P. S. I tried reproducing this problem inside VirtualBox but failed -- 2.6.30
inside it runs just ok. In case I'll have a chance to meet that bug I'll do my
best reporting it. Let me mark this ticket as resolved.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
