From: Chris Mason <mason@suse.com>
Subject: Re: Re: My mistake...
Date: 15 Jul 2002 15:27:14 -0400
Message-ID: <1026761234.4752.471.camel@tiny>
References: <001c01c22902$aef10660$0e01a8c0@englishbay.com>
	<200207121942.41361.vitaly@namesys.com>
	<001c01c22c26$7c0866e0$0e01a8c0@englishbay.com>
	<3D330C2C.3060500@neuronet.pitt.edu> 
	<005301c22c31$e69158e0$0e01a8c0@englishbay.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <005301c22c31$e69158e0$0e01a8c0@englishbay.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian <brian@english-bay.com>
Cc: reiserfs-list@namesys.com

On Mon, 2002-07-15 at 15:00, Brian wrote:
> Hello:
>
> If it's a small matter of helping out with a couple command line arguments
> then YES!

Shrug, I've never been wild about the namesys per support setup, but
Hans clearly tried to err on the side of free support, and not screwing
the users.  If your problem turns out to be a bug, the money is
refunded.  There is a balance that needs to be maintained between
cleaning up after user mistakes and working on new features/bugs.

Clearly we want the FS to be easy to fix when things go wrong, so it
does make things easier for everyone when problems are solved.

> 
> Just so we get this in perspective, I have over the years received help from
> the developers of named (including Cricket Lui), sendmail, samba and many
> others. On the other hand I have spent many hours online and off helping
> total strangers with their Linux questions, sometimes spending many hours
> helping to solve their problems.
> 
> So don't pull this $25 per question shit with me! I would rather suffer for
> my mistake and change to a different filesystem where I won't be hijacked
> for a $quarter$ every time I have a problem.

Read through the archives of the reiserfs list, and your thread.  Almost
nobody gets sent to the paid support link right away.  People try to
answer the question first, and if it becomes clear the problem is
non-trivial they are sent to the support link.  There are also many
non-namesys people on the list who answer questions.

From a different message in this thread:

Here is what the syslog has to say,

Jul 11 10:39:20 bozo kernel: super-459: read_super_block: super found at
block 16 is within its own log. It must not be of this format type.
Jul 11 10:39:20 bozo kernel: read_super_block: can't find a reiserfs
filesystem
on (dev 16:02, block 8, size 1024)

If the super found at block 16 is within its own log, this means one of
two things.

1) the log pointer in the super block is bogus
2) The wrong format was chosen when you ran --rebuild-sb.

run debugreiserfs /dev/xxxx and send the results.  It should be possible
to figure out the problem.

-chris


