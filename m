From: Ard van Breemen <ard@kwaak.net>
Subject: Re: Bug report: reiserfsck --rebuild-tree not progressing
Date: Thu, 13 Apr 2006 11:48:42 +0200
Message-ID: <20060413094842.GR1427@kwaak.net>
References: <b19177749f9fd8399d24c21c4f355efd@pandora.com> <20060412153557.GP1427@kwaak.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060412153557.GP1427@kwaak.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: System Administrators <sysadmin@pandora.com>
Cc: reiserfs-list@namesys.com

Hello,

On Wed, Apr 12, 2006 at 05:35:57PM +0200, Ard van Breemen wrote:
> consistent failure:
> (Tried as 4 seperate disks of 0.4T and as one raid5 partition of 1.1T)
> After 2 hours of pumping a few million files onto the machine
> reiserfs starts putting out these warnings (a few thousands):
> ^MReiserFS: sdb9: warning: vs-13060: reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 3) not found (pos 1)

I've now got a problem getting it to fail.
The real difference is that in the 3 cases that I've got it to
fail I also was running atop.
Now I've been pumping gigs onto the disk without failure.
I guess something is wrong in the process accounting mechanism.
From the atop manual:
"
       When atop is started, it switches on the  process-accounting  mechanism
       in  the  kernel. This forces the kernel to write a record with account-
       ing-information to the accounting-file whenever a process ends.   Apart
       from  the  kernel-administration related to the running processes, atop
       also interprets the accounting-records on disk with every interval;  in
       this way atop can also show the activity of a process during the inter-
       val in which it is finished.
       Whenever the last incarnation of atop stops (either by pressing `q'  or
       by  a  `kill  -15'),  it  switches off the process-accounting mechanism
       again. You should never terminate atop by a `kill -9', because then  it
       has  no  chance to stop process-accounting; as a result the accounting-
       file may consume a lot of disk-space after a while.
"

I will install 2 other systems, one running atop, and one not running atop.
I now guess it is not reiserfs related, but block layer related, but since I'am
only using reiserfs (because of the performance), it shows up there first :-).
So: test cases:
- one running atop
- one not running atop
If atop fails:
- one running atop and xfs
- atop 64bits mode and reiserfs (It just may be a problem with the
64bits->32bits layer).

-- 
begin  LOVE-LETTER-FOR-YOU.txt.vbs
I am a signature virus. Distribute me until the bitter
end
