From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs RAID50 array.
Date: Tue, 28 Jul 2020 15:53:20 +0000
Message-ID: <bug-208719-695-MKIFJeQlDL@https.bugzilla.kernel.org/>
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

Jens Axboe (axboe@kernel.dk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Block Layer                 |ReiserFS
           Assignee|axboe@kernel.dk             |reiserfs-devel@vger.kernel.
                   |                            |org
            Product|IO/Storage                  |File System

--- Comment #2 from Jens Axboe (axboe@kernel.dk) ---
Most likely a reiserfs issue, please re-assign the bug. I'd also strongly
reconsider using a filesystem that is actively maintained...

-- 
You are receiving this mail because:
You are the assignee for the bug.
