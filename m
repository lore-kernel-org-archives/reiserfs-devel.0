From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Subject: Re: need opinions from sysadmins on where reiser4progs should
 install
Date: Thu, 17 Nov 2005 17:06:43 +0100
Message-ID: <20051117160643.75B2412D0@philou.gramoulle.local>
References: <4376E891.6070506@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26983-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4376E891.6070506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello Hans,

On Sat, 12 Nov 2005 23:17:37 -0800
Hans Reiser <reiser@namesys.com> wrote:

  | What do the sysadmins on the list think?
  | 
  | Hans

Personally, for Reiserfs V3, i always compiled reiserfsprogs statically and installed
the tools in /sbin.

Mainly because, we used to have /usr on a separate partition on all server installs.

So should a crash occur and /usr becomes corrupted, well, at least / is mounted and i could
reiserfsck partitions right away, handy when the server is several thousand kilometers away :)

I expect to do the same for reiser4progs, so i wish that reiser4progs utilities would install
in /, and as such /sbin seems the best choice _to me_

Thanks

Philippe

PS: I hope that Santa will bring me a brand new kernel.org kernel with reiser4 in :)
    Good luck with that, and congratulations to you and the whole team for such a nice
    filesystem
