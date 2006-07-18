From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: remount with open files
Date: Tue, 18 Jul 2006 21:04:28 +0400
Message-ID: <200607182104.28860.zam@namesys.com>
References: <e9hvov$4dt$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29062-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e9hvov$4dt$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Andreas Moroder <andreas.moroder@sb-brixen.it>

hello,

On Tuesday 18 July 2006 10:40, Andreas Moroder wrote:
> Hello,
>
> we have a SLES8 system with kernel 2.4.19-64GB-SMP and would like to
> add ACLs to the files system. As far as I can see the ACL options are
> compoled into the kernel. Is it possible to add the acl option to the
> /etc/fstab entry and then remount the filesystem with -o remount even
> with open files ?
>
> When the remount is done do I have to starta another program or so or
> is this all I have to do ?

I tried it with suse 10.1 / Linux-2.6.16.13 and it works fine.

a reiserfs volume was mounted under /mnt/testfs, then I did

	mount -o remount,acl /mnt/testfs 

and setfacl started to work.
I even tried it with fs with one open file.  it worked.

-- 
Alex.

