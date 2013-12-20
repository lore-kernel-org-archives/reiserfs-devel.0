From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Fri, 20 Dec 2013 22:41:59 +0000
Message-ID: <bug-29162-695-wrGsDobein@https.bugzilla.kernel.org/>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162

D.K. <dkozlowski@sevone.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dkozlowski@sevone.com

--- Comment #55 from D.K. <dkozlowski@sevone.com> ---
I am also seeing what I believe to be an identical issue ( although it may not
be ). In an attempt to make it reproducible I have written a C++ program to
abuse a filesystem. I have been able to make the filesystem lock up after
running the program for a few hours. I should be able to reproduce this fairly
consistently so if there is some kind of information that will help in the
troubleshooting process for other please let me know and I can try to get it
for you. 

I am attaching my test program. 
The partition that is hanging is a PCI based SSD, but I have also seen this
problem on a RAID array on Spinning circular media and on a VM mounted on a
SAN. 

I have testing this with Kernel 3.2.28 and 3.12.2. I am currently compiling
3.12.5 and the tip of 3.12.y

-- 
You are receiving this mail because:
You are the assignee for the bug.
