From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 12:41:09 +0400
Message-ID: <20030331124109.G25533@namesys.com>
References: <20030331120014.C25533@namesys.com> <Pine.GSO.4.21.0303311028450.4102-100000@pille>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0303311028450.4102-100000@pille>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <sonne@first.gmd.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 10:34:30AM +0200, Soeren Sonnenburg wrote:

> Today a raid0 (stripe set) crashed here (there is a bug in western
> digital disks - they sometimes need a power cycle to accept commands
> again) and I ran the latest reiserfsck on /dev/md0 with --rebuild-sb
> --rebuild-tree.
> It successfully finished rebuilding the tree but now I observe the same
> thing robin observes: I cannot mount the device... so I ran reiserfsck
> /dev/md0 again and it complained that there is no superblock on the
> drive. So I tried to create one with reiserfstune --make-standard-journal

Well, if there is no superblock, it will certainly refuse to mount.

> /dev/md0 but that one just segfaults (unfortunately I have gcc on that
> machine as /usr /var are on the stripeset :-( ).

Is it just segfaults without any messages?
Anything interesting in the logs?
What reiserfsprogs version do you use?

> This is really strange since reiserfsck was really enumerating over all
> the files and everything seemed to be fine after the first rebuild-tree.

Hm, might it be that your harddrive eaten the superblock that it was supposed to write
to disk? ;)

> Hmm, I am running kernel 2.4.21pre6

Hm, new IDE changes? What if you try same stuff on 2.4.20?

Bye,
    Oleg
