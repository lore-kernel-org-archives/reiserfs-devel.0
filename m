From: Oleg Drokin <green@namesys.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Fri, 17 May 2002 08:56:11 +0400
Message-ID: <20020517085611.A6833@namesys.com>
References: <3CD72AB1.6010607@netscape.net> <20020507092207.A6678@namesys.com> <3CD82C76.2080706@netscape.net> <1020864892.32044.215.camel@tiny> <3CE46192.7080101@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CE46192.7080101@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuelkrause@netscape.net>
Cc: Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, May 17, 2002 at 03:49:06AM +0200, Manuel Krause wrote:

> I was curious and I stay curious, as I don't see any program deleting 3 
> files just before every crash...  (I don't have sizes, places and names...)

It is not necessarily happened to files direectly to a crash.
Any open file, that was deleted, cannot be deleted until it is closed.
e.g. if you'd do "sleep 1000000 </path/somefile ; rm /path/somefile",
/path/somefile won't be deleted until sleep finishes.
If system crash occured and there were still some open, but deleted files,
these files gets removed as part of recovery from crash process.
And it is not possible to find file's names/paths because corresponding
directory entries were already deleted.

BTW it is absolutely the same thing happens with ext2, once you see
e2fsck complains about "DTIME is zero", it deletes
not-yet-deleted-but-scheduled-for-deletion files.

Bye,
    Oleg
