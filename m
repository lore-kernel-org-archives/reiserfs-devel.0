From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Fri, 20 Dec 2013 22:44:20 +0000
Message-ID: <bug-29162-695-kNQUJXaN6x@https.bugzilla.kernel.org/>
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

--- Comment #56 from D.K. <dkozlowski@sevone.com> ---
Created attachment 119181
  --> https://bugzilla.kernel.org/attachment.cgi?id=119181&action=edit
Program to deadlock reiserfs

Compiled with gcc 4.7.1, glibc 2.15  

g++ torture.cpp -o torture -lpthread -lrt -std=c++11 -O2

-- 
You are receiving this mail because:
You are the assignee for the bug.
