From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 and bonnie problems
Date: Tue, 20 Apr 2004 17:37:39 +0400
Message-ID: <16517.10147.704572.959551@laputa.namesys.com>
References: <20040416203937.GY14134@nysv.org>
	<26F302F3-9042-11D8-8B4A-000A95CD704C@wagland.net>
	<2EB65FD6-924A-11D8-8B4A-000A95CD704C@wagland.net>
	<16516.54935.159587.423283@laputa.namesys.com>
	<61B07E02-92A8-11D8-8B4A-000A95CD704C@wagland.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <61B07E02-92A8-11D8-8B4A-000A95CD704C@wagland.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Wagland <paul@wagland.net>
Cc: reiserfs-list@Namesys.COM, Markus TXrnqvist <mjt@nysv.org>

Paul Wagland writes:
 > 
 > On Apr 20, 2004, at 9:51, Nikita Danilov wrote:
 > 
 > > Paul Wagland writes:
 > >> Bonnie: drastic I/O error (write(2)): No space left on device
 > >
 > > Err.. this is completely different from what we had previously: "No
 > > space left on device" is understandable where not reasonable. What is
 > > completely mysterious is "No such file or directory" error that you
 > > reported before.
 > 
 > Yes, last night I could not get that "No such file or directory" error 
 > to appear. I will try to reproduce that particular error again later 
 > tonight. However, this other problem happens at exactly the same time, 
 > and is an error in the reiser4.
 > 
 > Just to summarise everything that is written below, this is what bonnie 
 > is doing:
 > 1. write 3.5 GB onto a 4GB partition. This works
 > 2. delete 3.5 GB from a 4GB partition. This works.

Disk blocks freed during transaction are not actually freed until
transaction commits.

 > 3. I check using df that the disk space is free. That works.

But that "delayed freeing" confused users (they did cp, rm, but df has
still showed that space is used), so that statfs(2) (system call used by
df) was modified to take these delayed blocks into account and pretend
that they are free.

 > 4. write 3.5GB onto a 4GB partition. This fails.

Try to repeat this with sync before step 4.

 > 
 > At the time of failure, according to df there is stiff 3.5 GB
 > free. So, I say that reiser4 has a problem.

df lies.

 > 

[...]

 > 
 > Cheers,
 > Paul

Nikita.
