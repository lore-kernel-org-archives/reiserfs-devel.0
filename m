From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Big Block Device does not format...
Date: Thu, 19 Feb 2004 17:02:32 +0300
Message-ID: <200402191638.40028.vitaly@namesys.com>
References: <40348453.8020800@sr-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40348453.8020800@sr-online.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Pabst <opabst@sr-online.de>, reiserfs-list@namesys.com

On Thursday 19 February 2004 12:39, Oliver Pabst wrote:
> Hello list,

Hello Oliver,

> I try to mkreiserfs /dev/evms/userhomes and /dev/evms/userhomes is a
> drive-linked evms feature object with a sum of 18.8TB.
>
> mkreiserfs /dev/evms/userhomes gives following result:
>
> count_blocks: block device too large
> Aborted

which reiserfsprogs version do you use?
would you try the latest one from our ftp site?

> I am running 2.6.2-gentoo with large block devices enabled...
>
> anyone a hint?

-- 
Thanks,
Vitaly Fertman


