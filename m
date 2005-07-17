From: PFC <lists@boutiquenumerique.com>
Subject: Re: Resize of a reiser4 filesystem?
Date: Sun, 17 Jul 2005 17:16:52 +0200
Message-ID: <op.st2cqe1kth1vuj@localhost>
References: <42DA6EBE.7020100@mid.alexander.skwar.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42DA6EBE.7020100@mid.alexander.skwar.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


	I've got Gentoo and this is installed :

   sys-fs/reiser4progs
       Latest version available: 1.0.4
       Latest version installed: 1.0.3

I believe the name of the tool has changed and is now resizefs.reiser4

A copy of the man page :

resizefs.reiser4(8)                              reiser4progs  
manual                              resizefs.reiser4(8)



NAME
        resizefs.reiser4 - the program for resize reiser4 filesystem.

SYNOPSIS
        resizefs.reiser4 [ options ] FILE size[K|M|G]

DESCRIPTION
        resizefs.reiser4 is reiser4 filesystem resize program.

COMMON OPTIONS
        -V, --version
               prints program version.

        -?, -h, --help
               prints program help.

        -y, --yes
               assumes an answer 'yes' to all questions.

        -f, --force
               forces resizefs to use whole disk, not block device or  
mounted partition.

        -c, --cache N
               sets  tree cache node number to passed value. This affects  
very much behavior of libreiser4. It affects
               speed, tree allocation, etc.

PLUGIN OPTIONS
        -p, --print-profile
               prints the plugin profile. This is the set of default  
plugins used for all parts  of  a  filesystem  --
               format,  nodes, files, directories, hashes, etc. If  
--override is specified, then prints modified plug-
               ins.

        -l, --print-plugins
               prints all plugins libreiser4 know about.

        -o, --override TYPE=PLUGIN, ...
               overrides the default plugin of the type "TYPE" by the  
plugin "PLUGIN" in the plugin profile.

               Examples:

               resizefs.reiser4 -qf -o nodeptr=nodeptr41,hash=rupasov_hash  
/dev/hda2 /dev/hda3

REPORTING BUGS
        Report bugs to <umka@namesys.com>, <reiserfs-list@namesys.com>

SUPPORT
        You can get support at http://www.namesys.com/support.html

SEE ALSO
        libreiser4(8), measurefs.reiser4(8), debugfs.reiser4(8),  
fsck.reiser4(8) mkfs.reiser4(8) copyfs.reiser4(8)

AUTHOR
        This manual page was written by Yury Umanets <umka@namesys.com>




On Sun, 17 Jul 2005 16:44:14 +0200, Alexander Skwar  
<listen@alexander.skwar.name> wrote:

> Hello!
>
> I'm looking for a way to resize my reiser4 filesystems.
> Best would be an "online" option (ie. one, that does
> not require an unmount of the fs).
>
> In older packages, I found a man page for a resize_reiser4
> tool (not sure about the name). Even this manpage is gone
> in the sys-fs/reiser4progs-1.0.4 Gentoo package, which I've
> got currently installed.
>
> If there's no "online" way, an offline way would be
> appreciated as well.
>
> Thanks a lot,
>
> Alexander Skwar


