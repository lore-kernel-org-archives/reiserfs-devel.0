From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Strange directories after reisferfsck
Date: Tue, 4 Nov 2003 16:54:30 +0300
Message-ID: <200311041653.03841.vitaly@namesys.com>
References: <20031104065949.GA11108@p15104972.pureserver.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031104065949.GA11108@p15104972.pureserver.info>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kristian Koehntopp <kris@koehntopp.de>
Cc: reiserfs-list@namesys.com

On Tuesday 04 November 2003 09:59, Kristian Koehntopp wrote:
> Yesterday my / and /home crashed (Suse Linux 9.0 with reiserfs
> for everything except /boot) due to problems with the Nvidia 8x
> AGP driver. Reiserfs was able to recover / after a
> --fix-fixable, but needed a rebuild for /home. I was able to
> recover with almost no data loss and have disabled the Nvidia
> driver since.
>
> After the rebuild, I found lots of strange directories
> obviously belonging to a / partition in my /home. Some theories,
> which one is plausible:
>
> - The memory corruption due to the AGP problems brought about 800
>   MB worth of data down on /home during some erraneous sync (I
>   have one GB of RAM).
>
> - The /home partition holds lots of vmdk (VMware virtual disk
>   files). reiserfsck looked through all blocks during the
>   rebuild and interpreted contents of the vmdk files as valid
>   leaf nodes, installing them into the /home proper instead.

yes, if you have reiserfs images in files on reiserfs partition it 
can happen. you should compress such files or you may want 
to use  a crypto loopback device to avoid the problem, xor
encryption for example. 

reiser4 will be able to keep reiser4 images in files without such 
problems.

> - Part of the disk was used as a / a few years ago. (But the
>   file dates I saw were not consistent with that, they were less
>   than a month old).
>
> What happened?
>
> Kristian

-- 
Thanks,
Vitaly Fertman
