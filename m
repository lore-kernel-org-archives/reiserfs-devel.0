From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.18 release
Date: Tue, 3 Aug 2004 20:53:01 +0400
Message-ID: <200408032053.01040.vitaly@namesys.com>
References: <200408032014.33703.vitaly@namesys.com> <200408031826.30243.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19948-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408031826.30243.christian.mayrhuber@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

On Tuesday 03 August 2004 20:26, Christian Mayrhuber wrote:
> On Tuesday 03 August 2004 18:14, Vitaly Fertman wrote:
> > - handle suse's block allocator changes correctly;
>
> Does this mean older reiserfsck's may eat fs's with data
> written by kernel 2.6.7 or above?

If you use SuSe's oid packing allocator options on mounting and 
do not use SuSe's reiserfsprogs patch, reiserfsck --rebuild-tree 
may throw away some amount of items with forbidden item keys.

-- 
Thanks,
Vitaly Fertman

