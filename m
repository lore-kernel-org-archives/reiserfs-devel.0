From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sat, 11 May 2013 15:23:18 +0000 (UTC)
Message-ID: <20130511152318.E50DC11FB04@bugzilla.kernel.org>
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





--- Comment #46 from Matwey V. Kornilov <matwey.kornilov@gmail.com>  2013-05-11 15:23:18 ---

(In reply to comment #45)
> I've run into a series of locks of this kind. I can't add much more to what
> I've already reported. I haven't found a method of reliably reproduce this
> lock, my impression so far is that this one is related to:
> a) wake up from suspend to ram (maybe also to disk) and 

As for me, I've never used suspend on the PC where the problem is present. 

> b) certain /corruption/ layout in disk

Yep, this is quite interesting, because usual startup file-system check doesn't
report anything. Did the problem disappear after the file system had been
repaired? 

However, yet I've bought new hard drive for that PC, and installed new OS and
ext4, I still have old hard drive with the vulnerable reiserfs partition. I
think it will be useful if I reach it and run --rebuild-tree in order to see my
output.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
