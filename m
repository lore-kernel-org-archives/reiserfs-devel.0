From: Russell Coker <russell@coker.com.au>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 21:12:59 +0100
Message-ID: <200212232112.59316.russell@coker.com.au>
References: <3E06F360.7000708@namesys.com> <20021223155640.GB773@willow.seitz.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021223155640.GB773@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Vandegrift <ross@willow.seitz.com>, Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Mon, 23 Dec 2002 16:56, Ross Vandegrift wrote:
> On machines with Linux md RAID arrays that need to be remirrored,
> I do end up waiting a bit (10-30 seconds) due to read starvation, but
> this problem is so much better than it used to be it's hardly worth
> mentioning.

One thing I've done before is configure the boot scripts to set the RAID 
re-sync speed very low before fsck/mount time and then set it back later.  It 
didn't seem to do as much good as I thought it would though.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

