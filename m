From: Edward Shishkin <edward@namesys.com>
Subject: Re: how to use reiserfs with smaller journal?
Date: Fri, 09 Aug 2002 21:16:39 +0400
Sender: edward
Message-ID: <3D53F8F7.E1353765@namesys.com>
References: <20020809160159.GA381@home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Radim Kolar <hsn@cybermail.net>
Cc: reiserfs-list@namesys.com

Radim Kolar wrote:
> 
> I can not use reiserfs with smaller journal than default. I create
> filesystem with:
> mkreiserfs -s 513 /dev/hdd1
> output looks ok
> 
> mount /dev/hdd1 /mnt -t reiserfs
> mount: wrong fs type, bad option, bad superblock on /dev/hdd1,
> or too many mounted file systems

You need reiserfs with non-standard journal support. 
(Currently only in 2.5)
Edward.


> 
> syslog:
> Aug  9 17:53:57 home kernel: read_super_block: can't find a reiserfs
> filesystem
> on (dev 16:41, block 16, size 4096)
> Aug  9 17:53:57 home kernel: read_super_block: can't find a reiserfs
> filesystem
> on (dev 16:41, block 2, size 4096)
> 
> what is wrong?
