From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: /proc/mounts and data=journal
Date: Fri, 20 Dec 2002 00:16:47 +0100
Message-ID: <m3fzst8uqo.fsf@merlin.emma.line.org>
References: <200212192316.51412.bofh@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212192316.51412.bofh@coker.com.au> (Russell Coker's message
 of "Thu, 19 Dec 2002 23:16:51 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Russell Coker <bofh@coker.com.au> writes:

> I've applied the patches for mounting with data=journal.  However one problem 
> that I have discovered is that the data=journal status of a file system is 
> not shown in /proc/mounts, other tunable options of a file system such as 
> noatime are shown.

This also affects ext3fs. Leaving full quote and posting to linux-kernel
as well.

-- 
Matthias Andree
