From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser filesystem crashed
Date: Fri, 14 Nov 2003 00:46:31 +0300
Message-ID: <200311140046.31951.vitaly@namesys.com>
References: <E1AKFkr-0002Ad-00@parato.holisticas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E1AKFkr-0002Ad-00@parato.holisticas.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Usuario Jose <jose@holisticas.com>
Cc: reiserfs-list@namesys.com

On Thursday 13 November 2003 14:33, Usuario Jose wrote:
> Hi, friends:
>
> My copmputer has a hard disk with the following partition schema:
>
>
> 	/dev/hda1		windows backup
> 	/dev/hda2		windows xp ntfs
>
> /dev/hda3		win95 ext'd (LBA)
> 	/dev/hda5		linux swap
> 	/dev/hda6		linux  - resiserfs
>
> The linux partition crashed (my suspicions are after opening a 5MB pdf
> file). Following are the messages given by reiserfsck:
>
>
> #reiserfs --check /dev/hda6
> Bad root block 4294967295
>
> #reiserfs --rebuild-tree /dev/hda6
> .....
> Pass 0:
> ##### Pass 0 #####
> Loading on-disk bitmap .. ok, 963801 blocks marqued used
> Skipping 8406 blocks (superblock, journal.....) 955395 blocks will be read
> 0% =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0left =A0955077, 318
> /sec bread: Cannot read a block # 13236

it seems you use pretty old reiserfsprogs version. update it please.
this message means there are unreadable blocks on the fs.
read our bad block faq=20
    www.namesys.com/bad-block-handling.html
if you need our assistance please visit=20
    www.namesys.com/support.html

=2D-=20
Thanks,
Vitaly Fertman


