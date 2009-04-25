From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Formal Reiser4 inclusion and todo list?
Date: Sun, 26 Apr 2009 00:50:09 +0200
Message-ID: <49F393A1.4030004@gmail.com>
References: <alpine.DEB.2.01.0904181302440.6162@bogon.housecafe.de> <49EB1E3F.1020905@gmail.com> <542E227E-E31D-496C-93FB-19393133297F@MailNewsRSS.com> <200904250153.33258.volkerarmin@googlemail.com> <2E9381E6-A09A-4330-9A61-C4B7D7CE0E71@MailNewsRSS.com> <49F2CF9A.1060202@inn.nl> <49F2D43F.90105@ontolab.com> <8c113a260904250416n28fbdacs682ef8e6859b7dbf@mail.gmail.com> <49F339A2.9080705@ontolab.com> <200904252027.n3PKReMx073755@mail.meer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200904252027.n3PKReMx073755@mail.meer.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: William Fisher <fisher@meer.net>
Cc: reiserfs-devel@vger.kernel.org

William Fisher wrote:
> Folks:
>
> Is there a "formal" to-do list for R4 for it's eventual
> inclusion into the kernel source tree?
>
> I have asked Edward this question over a year ago,
> and was pointed to some scraps of the dead
> Namesys web site. 

You was pointed to a google cache which was valid
for a long time.

> Who knows if the list is even
> accurate today? It's hard to track progress without
> a "plan" and a list of development tasks.

Ok, we'll help you.
This is the original to-do list:
http://lkml.org/lkml/2006/8/3/38

The latest addressed issue was the one about
set_page_dirty_internal(): I have patched VFS
not so long ago:
http://marc.info/?l=linux-kernel&m=123452682220201&w=2

The following items are still unaddressed:

1. running igrab() in the writepage() path is really going to hammer
   inode_lock.  Something else will need to be done here.

2. Running iput() in entd() is a bit surprising.  iirc there are various 
ways
   in which this can recur into the filesystem, perform I/O, etc.  I 
guess it
   works..
   But again, it will hammer inode_lock.

3. the writeout logic in entd_flush() is interesting (as in "holy cow").
   It's very central and really needs some good comments describing what's
   going on in there - what problems are being solved, which decisions were
   taken and why, etc.

4. reiser4_wait_page_writeback() needs commenting.

5. reading the comment in txnmgr.c regarding MAP_SHARED pages: a number of
   things have changed since then.  We have page-becoming-writeable
   notifications and probably soon we'll always take a pagefault when a
   MAP_SHARED page transitions from pte-clean to pte-dirty (although I 
wouldn't
   recommend that a filesystem rely upon the latter for a while yet).

Feel free to address them.

Thanks,
Edward.
