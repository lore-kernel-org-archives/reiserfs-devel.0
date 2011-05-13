From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Fri, 13 May 2011 13:09:15 GMT
Message-ID: <201105131309.p4DD9F0H027752@demeter1.kernel.org>
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





--- Comment #12 from Frederic Weisbecker <fweisbec@gmail.com>  2011-05-13 13:09:03 ---
Ah I think I finally got something. I've run those git-reset/git-merge parallel
loops for one night. No result. I retried with kmail in parallel fetching
hundreds thousands emails. Still no result.

Then I let the machine this night doing nothing, there was just kmail in the
background.

And today it seems frozen. I can't login, the screen is shutdown and typing on
the keyboard doesn't shed it as usual. So I think I finally succeded to get a
crash :-D

Now whether it's that reiserfs crash or not, I don't know.

So I'm going to try some more things, this time with a serial console to get
the messages.

If you are aware of something more mechanical to reproduce, I'm really
interested.

Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
