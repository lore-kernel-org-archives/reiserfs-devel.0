From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser3.6 files inaccessable from rescue CD post reiserfsck --rebuild-tree
Date: Mon, 31 Oct 2005 11:34:42 +0300
Message-ID: <4365D722.8010409@namesys.com>
References: <b14e81f00510301555j24f63c43x6a1bbda08bd4e5d1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26744-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00510301555j24f63c43x6a1bbda08bd4e5d1@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

michael chang wrote:
> I know this seems kinda funky, and this is the first time this has
> ever happened to me using a reiser filesystem.  (I've found that after
> decent testing, the filesystems, like reiserfs3 work quite well.)
> 
> Anyways, I'd booted off of a Ubuntu 5.04 live CD and gotten gparted,
> and tried to use that to resize my reiserfs v3.6 partition (
> /dev/hda5, containing /boot inside (didn't put it as a seperate
> partition, to my own woe) and a ClusterKNOPPIX cloop image and all the
> files in the system).  Anyways, I tried to shrink the partition (which
> I'd done many with great sucess, albeit this was my first time using
> gparted to do it), but for some reason it ran reiserfsck -y
> --fix-fixable and wouldn't resize the partiton.  So I went and
> switched to parted, which while resizing told me that there was an
> error with one of the inodes.
> 
> So I figured I'd check the partition.  I went and ran reiserfsck
> --check /dev/hda5 and it went and told me I needed a rebuild tree.  So
> I ran reiserfsck --rebuild-tree /dev/hda5, told it yes, and let it
> run.
> 
> When I went back to mount the paritition, I could do an ls of the
> root, and see filenames.  But if I went in to one of the directories
> (e.g. /etc, /boot, or whatever) and list, I would get a list of the
> files, but -l would tell me the permission was denied to read the list
> of files, while running as root, from a rescue CD.  [At this point,
> the entire disk was unbootable, because GRUB would give an Error 16
> and sqawk because it couldn't read /boot/grub/menu.lst from the
> partition.]  I tried chmoding the files as root, just about
> everything, and it would always fail.
> 
> If I boot my Ubuntu install cd and run the "rescue" system, and try
> and select my reiserfs partition, it will fail, saying that it doesn't
> have the permisisons to execute /bin/bash.
> 

Please boot off install cd so that it does not mount problem reiserfs partition
(/dev/hda5) as root filesystem.
Mount /dev/hda5 to /mnt and run ls /mnt/bin/ -l
What do you get?

> So, I'm sitting here with my pc next to me, with a reiserfs partition
> that seems to have all the data intact on it, but gives a permision
> denied error when I'm running any tool as root, even to just get a
> directory listing and read the files.
> 
> Unfortunately, I didn't think to capture reiserfsck's output while it
> was doing its work, so I don't have a copy of that, unfortunately.
> 
> I don't have $20, or otherwise I would send it, but I would appreciate
> any help that could be given, if possible.  I understand you're all
> busy and resource-strapped, although I'm rather perplexed about my
> situation.  Thanks.
> 
> --
> ~Mike
>  - Just my two cents
>  - No man is an island, and no man is unable.
> 
> 

