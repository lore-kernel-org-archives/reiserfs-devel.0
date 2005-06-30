From: Bryan Henderson <hbryan@us.ibm.com>
Subject: Re: XFS corruption during power-blackout
Date: Thu, 30 Jun 2005 13:49:22 -0700
Message-ID: <OFBC8F19C9.0A8B9C84-ON88257030.006EB89B-88257030.00725493@us.ibm.com>
References: <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wedgwood <cw@f00f.org>
Cc: Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

>POSIX is broken in places

...

>If it happens differently I would call that a bug.

I think you're confusing goodness with correctness.  POSIX is a 
definition; it can't be broken.  A bug is where don't meet your own 
specification.  So if the spec doesn't say you have to be synchronous, 
it's not a bug not to be synchronous.  Call it a design flaw if you want.

>> In others, it implements "everything that was buffered when sync()
>> started is hardened before the next sync() returns,"
>
>That is what happens now.  I'm not sure any other behavior makes sense
>does it?

I think you quoted the wrong part.  From context, I think you meant 
"everything that was buffered when sync() started is hardened before 
sync() returns."  And it's also my understanding that current Linux does 
that.

Another Linux sync() behavior is that it keeps syncing super blocks until 
every super block is clean at the same moment.  That has given me fits.  I 
don't know what the goal of that is -- it came in around 2.4.10.

>POSIX is a bit more sane about fsync():
>
>      The fsync() function can be used by an application to indicate
>      that all data for the open file description named by fildes is
>      to be transferred to the storage device associated with the file
>      described by fildes in an implementation-dependent manner. The
>      fsync() function does not return until the system has completed
>      that action or until an error is detected.

Strange; that's not the way I remember it.  I remember it being much more 
vague;  in particular, I remember a specification that did not assume that 
a file is associated with a particular device and referred instead to 
"stable storage," the definition of which was entirely up to the 
implementation.  In other words, the definition I've been working from was 
more grown-up.  I wonder what the difference is.

>> and some 'sync' programs do multiple sync()s.
>
>Such programs are arguably broken (grub maybe?).  If one doesn't work,
>then why should doing it <n>-times?

It's because of the words before that:  "everything that was buffered when 
sync()
started is hardened before the next sync() returns."  The point is that 
the second sync() is the one that waits (it actually waits for the 
previous one to finish before it starts).  By the way, I'm not talking 
about Linux at this point.  I'm talking about so-called POSIX systems in 
general.

But it does sound like Linux has a pretty firm philosophy of synchronous 
sync (I see it documented in an old man page), so I guess it's OK to rely 
on it.

There are scenarios where you'd rather not have a process tied up while 
syncing takes place.  Stepping back, I would guess the primary original 
purpose of sync() was to allow you to make a sync daemon.  Early Unix 
systems did not have in-kernel safety clean timers.  A user space process 
did that.

--
Bryan Henderson                     IBM Almaden Research Center
San Jose CA                         Filesystems

