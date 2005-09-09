From: Christoph Hellwig <hch@infradead.org>
Subject: Re: List of things requested by lkml for reiser4 inclusion (to review)
Date: Fri, 9 Sep 2005 19:57:40 +0100
Message-ID: <20050909185740.GA11923@infradead.org>
References: <200509091817.39726.zam@namesys.com> <4321C806.60404@namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932573AbVIIS5o@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4321C806.60404@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, LKML <linux-kernel@vger.kernel.org>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 09, 2005 at 10:36:06AM -0700, Hans Reiser wrote:
> 1. pseudo files or "...." files
> 
>    disabled.  It remains a point of (extraordinary) contention as to whether it can be fixed, we want to keep the code around until we can devote proper resources into proving it can be (or until we fail to prove it can be and remove it).  We don't want to delay the rest of the code for that proof, but we still think it can be done (by several different ways of which we need to select one and make it work.)  Let us postpone contention on this until the existence of a patch that cannot crash makes contention purposeful, shall we?

please remove all unused code from the tree.  You're free to leave stubs
in so you don't have to redo all common code, but don't leave unused files
in the tree.

> 6. remove type safe lists and type safe hash queues.
> 
>    not done, it is not clear that the person asking for this represents a unified consensus of lkml.  Other persons instead asked that it just be moved out of reiser4 code into the generic kernel code, which implies they did not object to it.  There are many who like being type safe.  Akpm, what do you yourself think?

I think quite a few people complained ;-)  It's huge CPP abuse which we
generally don't want - at least for the hash case we already had something
similar (linux/ghash.h and got rid of it).  That beeing said a generic hash
abstraction without too much CPP abuse might be really useful, but the list
code should certainly go.

> 
> 8.  Remove all assertions because they clutter the code and make it hard to read
> 
>     We think this person was not an experienced security specialist,

please stop attacking people personally all the time.  You're certainly not
what I'd call an experienced security specialist either, but fortunately that
doesn't matter for this case at all.

Removing all assertations certainly doesn't make sense, we have them all
over the tree.  Whether your own assert macros makes sense is a different
question, but given that you use something similar in reiser3 and lots
of other drivers have their own things built around BUG() I won't complain
to loudly.

What should go on the other hand are useless assertation, like one that
asserts that something is non-NULL just before dereferencing it - the
latter gives a backtrace just as nice.


As additional requirements please give people time to actually audit the
codebase.  I've started but it's quite a pain with all the plugin
indirections right now.

One major item I found is that you're using your own code for the
read/write file operations, which not only duplicates core code but
also lacks features (vectored I/O, AIO, direct I/O) from the common code
and is totally buggy (it has no chance on working on architectures that
have completely separate address spaces for user/kernel like s390, please
check how they define PAGE_OFFSET).  Depending on your requirements you
might not use the complete generic code, but you should at least use
the most important fragments, ala XFS or ocfs, and improve them where
needed.

A very annoying small thing that comes to mind is the usage of
reiser4_internal.  Please remove it, all but exported symbol are
module-private.
