From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 15 Mar 2011 22:03:15 GMT
Message-ID: <201103152203.p2FM3F0q012227@demeter1.kernel.org>
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


Jeff Mahoney <jeffm@suse.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fweisbec@gmail.com,
                   |                            |jeffm@suse.com




--- Comment #8 from Jeff Mahoney <jeffm@suse.com>  2011-03-15 22:03:12 ---
Bastien, are you using ACLs or security xattrs (e.g. selinux) on your file
system?

If you're not, I'll have to keep looking, but it seems as though Frederic's BKL
replacement patches got the nested behavior of the BKL right but not the
drop-over-schedule part completely right.

The BKL can do nesting but drops the lock entirely over schedule. The reiserfs
write lock can do nesting but only drops one reference to the lock over
schedule. So if the lock is nested and a schedule occurs, the lock isn't truly
dropped.

The most obvious case of nesting the write lock like this is when using
extended attributes since it will nest journal transactions. There are others,
though.

I'll work up a patch to test this theory and post it shortly.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
