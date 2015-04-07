From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 07 Apr 2015 10:05:14 +0000
Message-ID: <bug-29162-695-sIABNGZIU3@https.bugzilla.kernel.org/>
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

Hamdi Hamdi <hhamdi@sevone.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hhamdi@sevone.com

--- Comment #66 from Hamdi Hamdi <hhamdi@sevone.com> ---

Hi,

After some research there is a scenario which triggered my suspicion (ref
http://lxr.free-electrons.com/source/fs/reiserfs/journal.c?v=3.3):
    1) several threads call `queue_log_writer` and are put to sleep
    2) J_WRITERS_QUEUED bit is set
    3) `check_journal_end` returns nonzero value and the `do_journal_end`
continues it's execution
    4) at line 4252 it clears the bit and wakes 1 thread
    5) no other thread enters `queue_log_writer` due to some unknown reason and
the bit is not set again
    5) the awaken thread ends up with `if (!check_journal_end(th, sb, nblocks,
flags)` 
        returning 0 which triggers the awakening of another thread
    6) No one will be awaken since there is no bit set on `if
(test_and_clear_bit(J_WRITERS_QUEUED, &journal->j_state))`,
        except when the execution reaches line 4253

One ugly workaround for testing purposes at line 4253:
4253    wake_up(&(journal->j_join_wait));
    replaced with
4253    wake_up_all(&(journal->j_join_wait));

There must be a reason for this to happen on high loads only so any help and/or
suggestions is more that welcome !

-- 
You are receiving this mail because:
You are the assignee for the bug.
