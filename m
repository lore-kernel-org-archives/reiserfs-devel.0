From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Thu, 10 Feb 2005 23:54:38 +0300
Message-ID: <200502102354.38738.vitaly@namesys.com>
References: <200502082321.07706.kris@cp-data.de> <1107950476.9024.205.camel@tribesman.namesys.com> <200502100754.56823.kris@cp-data.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502100754.56823.kris@cp-data.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Placzek <kris@cp-data.de>, reiserfs-list@namesys.com

> Okay, I've done two versions, one with and one without '-S'. I applied the
> following commands to the image copy (the image itself is untouched, I
> always worked with fresh copies):
>
> # reiserfsck -y /dev/loop/0 --rebuild-sb
> # reiserfsck -y /dev/loop/0 --check
> # reiserfsck -y /dev/loop/0 --rebuild-tree
> # debugreiserfs -p /dev/loop/0 | bzip2 -c > meta.bz2
> # reiserfsck -y /dev/loop/0 --rebuild-tree -S
> # debugreiserfs -p /dev/loop/0 | bzip2 -c > meta-S.bz2
>
> Use ftp://80.133.138.104:12121 

sorry, but I get 'no route to host' every time.

-- 
Thanks,
Vitaly Fertman

