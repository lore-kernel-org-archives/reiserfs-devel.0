From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: Snapshots a la NetApp?
Date: 23 Mar 2003 10:16:56 +0100
Message-ID: <1048411014.1427.5.camel@wusel.schnulli.de>
References: <200303221822.34401.phma@webjockey.net>
	 <33433.10.20.2.148.1048390681.squirrel@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <33433.10.20.2.148.1048390681.squirrel@alpha>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kend@xanoptix.com
Cc: reiserfs-list@namesys.com

Am Son, 2003-03-23 um 04.38 schrieb kend@xanoptix.com:
> I'm just wondering if there's any development being done on NetApp-like
> snapshots.  (This differs from LVM snapshots in that it's file-by-file,
> instead of volume based.)  If not, has anyone given it any consideration? 
> It would be a huge win for the RAID-in-a-box folks, and, speaking as a
> sysadmin, is something about which I dream frequently.
> 
> Just curious...
> 
> Ken D'Ambrosio
> Sr. SysAdmin,
> Xanoptix, Inc.

Hi,
you can look at the URL below. It's a kind of snapshot inspired by
NetApp, but has nothing to do with LVM or the filesystem. It also has a
different behaviour.

-- 
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk

