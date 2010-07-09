From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16334] reiserfs locking (v2)
Date: Fri, 9 Jul 2010 21:39:40 GMT
Message-ID: <201007092139.o69Ldetl022797@demeter.kernel.org>
References: <bug-16334-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-16334-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16334





--- Comment #1 from Rafael J. Wysocki <rjw@sisk.pl>  2010-07-09 21:39:36 ---
On Friday, July 09, 2010, Frederic Weisbecker wrote:
> On Thu, Jul 08, 2010 at 06:34:25PM -0700, Linus Torvalds wrote:
> > On Thu, Jul 8, 2010 at 4:33 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> > > Bug-Entry       : http://bugzilla.kernel.org/show_bug.cgi?id=16334
> > > Subject         : reiserfs locking (v2)
> > > Submitter       : Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > > Date            : 2010-07-02 9:34 (7 days old)
> > > Message-ID      : <20100702093451.GA3973@swordfish.minsk.epam.com>
> > > References      : http://marc.info/?l=linux-kernel&m=127806306303590&w=2
> > 
> > Frederic? Al? I assume this is some late fallout from the BKL removal
> > ages ago.. It's the old filldir-vs-mmap crud, but normally it should
> > be impossible to trigger because the inode for a directory should
> > never be mmap'able, so we should never have the same i_mutex lock used
> > for both mmap and for filldir protection.
> > 
> > We saw some of that oddity long ago, I wonder if it's lockdep being
> > confused about some inodes.
> 
> 
> 
> I think it has been there from the beginning. At least it was there before
> the reiserfs bkl removal in .32.
> 
> 
> Indeed the readdir <-> unmap/release inversion problem can not happen.
> But Al said that can happen between write and release. (Although I don't see
> where write takes the inode mutex).
> 
> He also highlighted the fact that reiserfs refcounting based on i_count
> was totally broken.
> 
> He has a fix the whole in the vfs tree, in the for-next branch on commit
> 6c2bdaf089a3876226893fab00dd83596c465ad2
> "Fix reiserfs_file_release()"
> 
> No more uses of the i_mutex on release after that, nor i_count, but a private
> openers refcount and a tailpack mutex per reiserfs inode.
> 
> 
>

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
