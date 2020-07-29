From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs FS.
Date: Wed, 29 Jul 2020 02:20:34 +0000
Message-ID: <bug-208719-695-ZxMBe9Zpf1@https.bugzilla.kernel.org/>
References: <bug-208719-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-208719-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208719

--- Comment #4 from deference@null.net ---
On the suggestion to not use reiserfs:

My interest in using reiserfs was so that I would have tail packing. I've
searched online and can't find another FS with this function for Linux.
The reason I need tail packing is because I keep a bunch of mostly git
repositories on my system. These contain a lot of files that are either small
or are empty. I could try to hardlink all the empty files and small duplicate
files, but git would complain. I could compress the source code like I do with
normal code bases, but then I'd need to decompress and update them all.
Writing a script to do that would be nothing, it's just the time involved
compressing/decompressing that would be a waist (which is saying nothing
compared to git's love for full histories instead of up-to-the-last-4-versions
or something).

-- 
You are receiving this mail because:
You are the assignee for the bug.
