From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 17:08:52 -0700
Message-ID: <4330A494.7010704@namesys.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz> <43301FA0.7030906@slaphack.com> <20050920175727.GA17820@thunk.org> <1127240326.10407.22.camel@localhost> <20050920211136.GA6179@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750755AbVIUAIw@vger.kernel.org>
In-Reply-To: <20050920211136.GA6179@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jonathan Briggs <jbriggs@esoft.com>, David Masover <ninja@slaphack.com>, Pavel Machek <pavel@suse.cz>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Theodore Ts'o wrote:

>On Tue, Sep 20, 2005 at 12:18:46PM -0600, Jonathan Briggs wrote:
>  
>
>>I use Reiser3 and Reiser4 on all my systems and fsck has always worked
>>even if it has been much slower than I would like.  The only problems
>>I've experienced have been on the same level as when an ext2/3
>>filesystem fsck dumps several directories of unlabeled files into lost
>>+found.
>>    
>>
>
>You've obviously never kept several dozen reiserfs filesystem images
>(for use with Xen or User-Mode Linux) on a reiserfs filesystem, and
>then had a hardware failure bad enough that the fsck had to try to
>rebuild the b-tree, I take it?
>  
>
That is fixed in V4.  Until people start to use V4 they should compress
their V3 backup images that they store on V3, or store them on separate
partitions.  I regret that fixing it without a disk format change was
not possible.

Hans
