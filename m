From: "David Dabbs" <david@dabbs.net>
Subject: RE: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
Date: Wed, 4 Aug 2004 13:29:37 -0500
Message-ID: <20040804183243.B91D615DBB@mail03.powweb.com>
References: <411126C2.20007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411126C2.20007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: "'Vladimir V. Saveliev'" <vs@namesys.com>, reiserfs-list@namesys.com



> >
> For us to reproduce, we need to have a script of some sort that exactly
> reproduces what you did.
> 
> It is especially significant to note such things as whether you might
> have run out of disk space, etc.
> 

No, that was not the case. Because of that very issue, I just bought a
larger drive so I could complete more extensive mongo runs. I would have
known if the disk had filled. Last time I checked df during the later stages
of a run it was reporting something like 12% in use.

> It makes a lot of sense that you did not run stock mongo, because elena
> runs that a lot and we likely would have hit the bug already if you had.

Yes, except that I reran mongo without the MKFILES and MKDIRS phases, and as
I mentioned in another post, with the exception for an extra print statement
to track script progress, no changes were made to stock mongo sources.

If you believe it will help, I'll tar up my mongo directory and place on my
web site. Will follow-up.


David



