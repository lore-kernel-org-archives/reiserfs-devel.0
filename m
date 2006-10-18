From: James Courtier-Dutton <James@superbug.co.uk>
Subject: Re: Crash Corse in Partition Recovery
Date: Wed, 18 Oct 2006 14:54:58 +0100
Message-ID: <45363232.9060800@superbug.co.uk>
References: <cc3fd8f30610180606n12707760h747c95d214324ed8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <cc3fd8f30610180606n12707760h747c95d214324ed8@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Corey McGuire <coreyfro@coreyfro.com>
Cc: reiserfs-list@namesys.com

Corey McGuire wrote:
> Hey all,
> 
> I was updating my system's bios and my drives got reordered.  When I
> went to nuke my Windows drive, I missed and hit my swap and reiserfs
> drive.  I was wondering if there is a web sight that gives step by
> step instructions for recovery, or if you guys had a silver bullet
> method for findind the begining and ends of a partition.  I don't
> remember the exact size of my swap, but I know it came first.  Nothing
> has happened since I messed up the partition table and I ran "DD" so I
> have an image of the drive for safe exploration.
> 
> Thanks!
> 

gpart might help

http://www.stud.uni-hannover.de/user/76201/gpart/
