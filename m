From: "Danny Milosavljevic" <danny_milo@yahoo.com>
Subject: Re: a bit OT: traditional Unix filesystems
Date: Thu, 14 Sep 2006 17:13:56 +0000 (UTC)
Message-ID: <eec2kk$d2n$1@sea.gmane.org>
References: <20060914170544.GA7793@tranquility.scriptkitchen.com>
Reply-To: danny.milo@scratchpost.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

On Thu, 14 Sep 2006 13:05:44 -0400, Payal Rathod wrote:

> Hi,
> I have a small OT query on working of traditional filesystem of Unix.
> Can someone comment/correct me on the query below?
> 
> If i type $ cat /tmp/payal.txt (according to my knowledge) [...]
[unverified by me, and unrelated]

> Now if tmp is on different partition or harddisk, how will directory
> entry of "?" point it out exactly? 

The kernel has a list of mountpoints (see "/proc/<pid>/mounts") per
process. It looks there if path argument starts with one of those, and if
so, passes the path on to the topmost filesystem handler for that
mountpoint (it also knows the device, it is part of the mountpoint list).

> As far as I know, directory entry
> contains names and inode number and not the device details, then how
> does it exactly work? 

For mountpoints, the kernel checks the mountpoint table (in kernel memory,
per process) before passing the request on to the (topmost) filesystem that
handles that prefix (which reads the directory entry and fetches the inode
mentioned there).

cheers, 
  Danny

