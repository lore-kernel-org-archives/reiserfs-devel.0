From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: reiserfs data recovery
Date: Mon, 28 Jul 2003 01:22:36 +0200
Message-ID: <3F245EBC.9070405@netscape.net>
References: <20030727153826-191600041>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030727153826-191600041>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dsen@homemail.com
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/28/03 00:39, dsen@homemail.com wrote:
> After a hard disk crash, I dont see the reiserfs filesystems anymore 
> (cant mount them) although the partitions are there and the ext2 
> filesystems are there. What are my best options trying to retrieve any 
> data that were there in the reiserfs partions?
> 
> DS
> 

Try the following from a spare/rescue partition:

A.1) Try the most recent reiserfsprogs from
       ftp://ftp.namesys.com/pub/reiserfsprogs
      on your lost partitions and provide the info of
      "reiserfsck --check /lost/partition"

A.2) Try "reiserfsck --rebuild-tree /lost/partition on your
      own risk (!!!)

B) Use most recent plain kernel (> 2.4.19)

C) Provide more info in general (versions of kernel,
    reiserfsprogs, distro, credit card info ;-)
    and so on...)

D) Refer to http://www.namesys.com/support.html


You can mix the things above, but if you can, use at least the row A.1, 
C, B, A.2, always considering D before the next full report!

Best wishes,

  Manuel

