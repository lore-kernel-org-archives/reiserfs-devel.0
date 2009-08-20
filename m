From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13556] Random oopses
Date: Thu, 20 Aug 2009 14:28:35 GMT
Message-ID: <200908201428.n7KESZ1M031494@demeter.kernel.org>
References: <bug-13556-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13556-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13556





--- Comment #6 from Roland Kletzing <devzero@web.de>  2009-08-20 14:28:32 ---
>So, problem, most probably, in data=journal option.

yes, very likely. 

possible related one:
http://marc.info/?t=124680365400002&r=1&w=2

that user is also using "data=journal"

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
