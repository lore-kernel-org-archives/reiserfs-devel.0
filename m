From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: phantom corruptions
Date: Sat, 31 Aug 2002 18:04:07 +0400
Message-ID: <200208311804.07303.vitaly@namesys.com>
References: <m3it1shx0d.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3it1shx0d.fsf@multivac.cwru.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Jarc <prj@po.cwru.edu>, reiserfs-list@namesys.com


Hi, 

On Saturday 31 August 2002 01:11, Paul Jarc wrote:
> I'm using Linux kernel 2.4.18 and reiserfsprogs 3.6.3.  I have two
> filesystems where reiserfsck --check reports that there are
> corruptions which can be fixed with --fix-fixable, but --fix-fixable
> reports that there are no corruptions.  The full output of is
> available here:
> http://multivac.cwru.edu./prj/reiser.tar.gz
> Should I resort to --rebuild-sb or --rebuild-tree?  Out of curiosity,
> can those operations do any harm to a noncorrupted filesystem?
>
>
> paul

nlinks are not fixed because these files were unlinked but their bodies 
left in the tree somehow. So you have some files in the tree which are 
unreachable but the tree is consistent and you won't have any problem 
if continue working with it. nlink check and its fixing on fix-fixable 
was not mature in 3.6.3 and it was changed in 3.6.4-pre1.

-- 

Thanks,
Vitaly Fertman
