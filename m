From: Anders Widman <andewid@tnonline.net>
Subject: Re: How to work around bad blocks?
Date: Mon, 10 Mar 2003 21:50:35 +0100
Message-ID: <14221307140.20030310215035@tnonline.net>
References: <200303102115.50039.dirk.leber@web.de>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303102115.50039.dirk.leber@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Leber <dirk.leber@web.de>
Cc: reiserfs-list@namesys.com

> Hello List,
> I am the unhappy owner of a "corrupt" ReiserFS. All the other partitions on
> the same disk work fine, just this one seems to have some bad blocks. HEre
> are some outputs:

<snip>

>> badblocks -b 4096
> [detects bad blocks 7503858 - 7503871]

> Obviously the build-tree option also fails. The "How Reiser handles Bad
> blocks-FAQ" can only be considered a bad joke, since you need a degree in
> computer science AND a mountable filesystem for fooling the FS in that way.

Agreed  that  handling  of  bad  blocks  in  most FS in Linux is quite
annoying and far from optimal.

> What I would like to do is, detecting the bad blocks, freeing them (accepting
> there content) rebuilding the tree (or not) and than mounting it while
> accepting that some files will be corrupt. 

> What can I do? 

Right  now  the easiest way it to get a new drive and use dd_rescue to
move  the data. dd_rescue can copy the contents from your bad drive to
a file and run fsck on the file and "mount -o loop".

//Anders

--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

