From: Matt Stegman <matts@ksu.edu>
Subject: Re: Sudden FS Corruption
Date: Thu, 4 Sep 2003 23:09:17 -0500 (CDT)
Message-ID: <200309050409.h8549Hr4001133@mailq1.cc.ksu.edu>
References: <200309030457.h834vpr4023818@mailq1.cc.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309030457.h834vpr4023818@mailq1.cc.ksu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On  2 Sep, Matt Stegman wrote:
> Hello,
> 
> I just got some corruption on my reiserfs /usr filesystem tonight.  I
> think it may be related to hardware problems, but I'm not sure.

I've ruled out memory problems, as memtest ran for several hours with no
errors.  The only hard drive problems I'm having now is that it doesn't
always spin up with the computer.

I still don't know if this is a reiserfs problem, or a disk problem, but
since the only corruption I saw was on a reiserfs filesystem (while I
was writing files at roughly the same time to ext3 on the same physical
device, and they were not corrupted) I'm tempted to blame reiserfs.

And I haven't seen any corruption of data since two days ago.  Thanks to
those of you whom responded, but I don't have a clue what was going on.

-- 
    -Matt Stegman

