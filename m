From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Fsck over Telnet is slow.
Date: Fri, 31 May 2002 03:16:22 -0600
Message-ID: <20020531091622.GA597@turbolinux.com>
References: <1073646515.20020531102130@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1073646515.20020531102130@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

On May 31, 2002  10:21 +0200, Anders Widman wrote:
>    Is  it just me, but I think reiserfsck is slow over telnet, or even
>    slower   over  ssh. It seems as it would be better to not print the
>    progress as fast, if the connection to the terminal is slow.

e2fsck used to have the same problem when you enabled the "progress
meter".  What it does now is only update the progress on the screen
every 10th of a second (or whatever) by checking how long ago the last 
update was.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

