From: Bryan Henderson <hbryan@us.ibm.com>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 08:51:10 -0700
Message-ID: <OF06B1DA23.460F4EA9-ON87256D49.0056BE85-88256D49.00570797@us.ibm.com>
References: <200306190123.00756.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306190123.00756.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: linux-fsdevel@vger.kernel.org, linux-fsdevel-owner@vger.kernel.org, reiserfs-list@namesys.com, Matthew Wilcox <willy@debian.org>





>It seems to me that punching a hole in a file is actually easier than
>truncating a file as we don't have to change the length.  The issues of
>mmap'd files and writing to a block that's being punched should be the
same
>as if the file was truncated.

Except that in most Linux kernels, a VM interface specifically for
truncating is exported for use by loadable modules, whereas there isn't an
interface to remove pages from the middle of a file cache.

There ought to be, though.  I consider this a gaping hole in the Linux VM
interface.  Proposals to fill it in have been floated recently on
linux-kernel.

Bryan Henderson                            IBM Almaden Research Center
San Jose CA                                Filesystems

