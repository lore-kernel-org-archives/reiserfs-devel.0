From: Maciej Matysiak <phoner.reiserfs@blah.pl>
Subject: Re: kernel BUG at prints.c:334
Date: Mon, 06 Jan 2003 08:36:22 +0100
Message-ID: <hhd6navifd.fsf@blah.pl>
References: <hhr8bv7cm6.fsf@blah.pl> <20030106101149.B1881@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030106101149.B1881@namesys.com> (Oleg Drokin's message of
 "Mon, 6 Jan 2003 10:11:49 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On the 6th of January 2003 at 08:11, Oleg Drokin <green#namesys.com> wrote:

> Logs you just provided show that your harddrive cannot remember what it was
> supposed to store anymore.

yes. it appeared that the disk has just died. without any warning, just
stopped spinning. i didn't know that at the time of sending the mail (i've had
only remote access to the server), so please forgive me wasting your time.

btw., it appears for me that ibm disks have something like 'y2k3 problem'.
it's a poor joke, but i got already 3 ibm disks that died in my servers this
year. that one was working not even 3 weeks. all of them scsi, made in hungary
or italy. is it my bad luck, or should i buy seagate next time? (rhetorical
question, i don't want to start flamewar here).

> Yes, reiserfs is not very well prepared to I/O errors while writing to
> journal, hence it panicked.

but could the errors be a bit more descriptive, please :)

 m.m.
-- 
 in backup we trust.
