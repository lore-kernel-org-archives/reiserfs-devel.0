From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck goes to and endless loop
Date: Mon, 28 Apr 2003 09:42:25 +0400
Message-ID: <20030428054225.GC22902@namesys.com>
References: <1051499797.12231.27.camel@linuxclient>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1051499797.12231.27.camel@linuxclient>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dr Aldo Medina <aldomedina@hotpop.com>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 27, 2003 at 10:56:47PM -0500, Dr Aldo Medina wrote:
> Trying to recover some deleted file, I used losetup /dev/loop0
> backupcopy (being this a backup of the partition). I then use reiserfsck
> --rebuild-tree -S /dev/loop0. I've tried ru 

Hm.
Well, just guessing on your problem based on the subject.
If you have reiserfsprogs 3.6.4-2 .. 3.6.4-4 from Debian distribution.
you must either download and compile reiserfsprogs yourself or upgrade to
3.6.6-1 from their unstable branch.
There was known bad patch included into debian's build of reiserfsprogs.

Bye,
    Oleg
