From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 15:56:44 +0300
Message-ID: <20040804125644.GQ1284@nysv.org>
References: <200406150022.34578.vitaly@namesys.com> <200408041434.41816.vitaly@namesys.com> <20040804105208.GO1284@nysv.org> <200408041649.38622.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19979-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408041649.38622.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Wed, Aug 04, 2004 at 04:49:38PM +0400, Vitaly Fertman wrote:
>1) copy data off, mkfs or fsck, copy data back ;
>2) a convertion program. The one I have been writing is not finished yet.

Then all I can say is, please, please, please remove the disk format
change from the fsck as soon as you can, because people will want
to fsck their disks without data loss.

Hans asked to take the programs away, I agree, if a convertion program
is coming. Also there are bugfixes, which should be released, so maybe
re-release the progs without fsck converting backup blocks...

You could then release the convertion program separately or include
it in the next reiser4progs package.

Do you think this is possible for the common good?

Thanks!

-- 
mjt

