From: Maciej Matysiak <phoner.reiserfs@blah.pl>
Subject: Re: kernel BUG at prints.c:334
Date: Mon, 06 Jan 2003 10:23:52 +0100
Message-ID: <hh4r8mtyvr.fsf@blah.pl>
References: <hhr8bv7cm6.fsf@blah.pl> <20030106101149.B1881@namesys.com>
	<hhd6navifd.fsf@blah.pl> <20030106104436.A2174@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030106104436.A2174@namesys.com> (Oleg Drokin's message of
 "Mon, 6 Jan 2003 10:44:36 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On the 6th of January 2003 at 08:44, Oleg Drokin <green#namesys.com> wrote:

>> btw., it appears for me that ibm disks have something like 'y2k3 problem'.
>> it's a poor joke, but i got already 3 ibm disks that died in my servers
>> this year. that one was working not even 3 weeks. all of them scsi, made in
>> hungary
> Ones from Hungary had pretty much of bad press for two years already starting
> with infamous (IDE) DTLA-307030 series, I believe.

all my dead ibm disks are scsi. that last was identified as IC35L036UWD210-0.

>>> Yes, reiserfs is not very well prepared to I/O errors while writing to
>>> journal, hence it panicked.
>> but could the errors be a bit more descriptive, please :)
> It said "I/O error doing so and so".
> And lots of SCSI diagnostic from SCSI layer prior to that.
> What do you consider to be more informative message (with example, please).

after thinking a bit more about that and looking at the logs again, i have to
admit that you're absolutely right. sorry for the noise.

 m.m.
-- 
 use gnus, not guns!
