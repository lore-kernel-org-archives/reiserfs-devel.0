From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Feature request: online fsync disable
Date: Sun, 25 Aug 2002 23:20:16 +0200
Message-ID: <m3n0raskj3.fsf@merlin.emma.line.org>
References: <3D661C89.C8A805D7@baldauf.org>
	<15718.8710.244926.960377@laputa.namesys.com>
	<20020823155658.A962@namesys.com> <3D6623BE.4040500@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D6623BE.4040500@namesys.com> (Hans Reiser's message of "Fri,
 23 Aug 2002 15:59:58 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> writes:

> It is a reasonable feature request I think.

A file system that has a switch "oh, you can throw away my data if you
like" is no good at all. If the application + FS interaction leads to
contention, then you have to choices to optimize: the application or the
file system. We've had this kind of discussion before, with a different
focus: on mail transfer agents. There have been considerations of
merging fsync() operations and committing them at the same time, and
asynchronous operation or threading might in fact help the application.

I'd not trust a file system that even has a switch to let it ignore
fsync(). Please let me know if your file systems exhibit this behaviour
so I can statfs() in my applications and if I see a file system that
does ignore fsync() just call raise(SIGKILL);

-- 
Matthias Andree
