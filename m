From: Dan Pritts <danno@internet2.edu>
Subject: Re: [OpenAFS] Re: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation fault with kernel 2.4.22-1.2174.nptl
Date: Thu, 4 Mar 2004 18:07:25 -0500
Message-ID: <20040304230725.GA19887@internet2.edu>
References: <20040304005117.M99283@soltis.cc> <20040304005913.M1858@soltis.cc> <20040304002804.GA5722@dbz.icequake.net> <20040304014303.M64769@soltis.cc> <4046A6A8.2000609@matchmail.com> <20040304071846.GB324@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040304071846.GB324@dbz.icequake.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@matchmail.com>, jds <jds@soltis.cc>, Ryan Underwood <nemesis-lists@icequake.net>, reiserfs-list@namesys.com, openafs-info@openafs.org

On Thu, Mar 04, 2004 at 01:18:46AM -0600, Ryan Underwood wrote:
> > No, if you're going to be stacking filesystems, use ext2, not ext3.  You 
> > will get better performance, and there's no use in having two levels of 
> > journaling in this case.
> 
> You might also think about bigger than 100MB cache file.  A big cache
> helps out AFS client performance tremendously.  But definitely use ext2
> and not ext3 as others have said.

I realize it won't work out of the box, but has anyone given any
thought to putting the cache in tmpfs?

Seems like this might be the best of both worlds - when the system is low
on RAM it can use swap, but when you've got plenty of RAM you avoid the
overhead of writing the cache files to disk.

more flexible than memcache, faster than disk cache.  My understanding
(limited) of the tmpfs on linux suggests that it might be an easy change
to make in the code for someone who understood the data structions better
than i do ;)

mostly, just curious...can anyone say?

danno
--
dan pritts                                       danno@internet2.edu
systems administrator                            734/352-4953 office
internet2                                        734/834-7224 mobile
