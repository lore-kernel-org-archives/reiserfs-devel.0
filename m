From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Wed, 09 Feb 2005 15:22:08 +0300
Message-ID: <1107951728.19646.210.camel@tribesman.namesys.com>
References: <200502082321.07706.kris@cp-data.de>
	 <200502091004.33754.kris@cp-data.de> <4209D935.1060203@namesys.com>
	 <200502091256.57533.kris@cp-data.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502091256.57533.kris@cp-data.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Placzek <kris@cp-data.de>
Cc: "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com

Hello

On Wed, 2005-02-09 at 14:56, Christian Placzek wrote:
> On Wednesday 09 February 2005 10:34, you wrote:
> >
> > Sorry, but what does df  -T say?
> > Does it say that  reiserfs filesystem is mounted on /mnt/temp1?
> No, it replied:
> # /dev/loop/0   ext2    69529276        20  65997368   1% /mnt/temp1
> 
> If I force mount with -t reiserfs it says:
> root@marvin:/home/kris 0$ # mount -o ro -t reiserfs /dev/loop/0 /mnt/temp1/
> mount: wrong fs type, bad option, bad superblock on /dev/loop/0,
>        or too many mounted file systems
> 

what does dmesg say after mount attempt?

> Thanks, this is a good hint, but I don't know how to change the identifier of 
> the filesystem. I know that normally mkfs.* does this task, but my friend's 
> overwriting of the superblock probably has changed the identifier of the 
> filesystem. Is it possible to apply mkreiserfs on the image whithout running 
> the risk to lose any data?
> 


