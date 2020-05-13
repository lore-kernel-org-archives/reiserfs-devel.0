From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 207717] reiserfs: data race on inode->i_size in
 reiserfs_write_full_page()
Date: Wed, 13 May 2020 03:31:07 +0000
Message-ID: <bug-207717-695-hBjW1xSmMw@https.bugzilla.kernel.org/>
References: <bug-207717-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-207717-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207717

Jia-Ju Bai (baijiaju1990@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeffm@suse.com

-- 
You are receiving this mail because:
You are the assignee for the bug.
