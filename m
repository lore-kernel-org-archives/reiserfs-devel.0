From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 12:45:04 +0200
Message-ID: <1054809903.1995.83.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <20030605090435.GE7950@namesys.com>
	 <1054804624.1997.39.camel@wusel.schnulli.de>
	 <200306052029.41437.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14429-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306052029.41437.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

Am Don, 2003-06-05 um 12.29 schrieb Russell Coker:
> On Thu, 5 Jun 2003 19:17, Heinz-Josef Claes wrote:
> > Perhaps this is a good idea. I'll try to test the performance. Since the
> > servers are only used for an (additional) online backup (like
> > snapshots), there will not be really critical data on them. I'll see if
> > the performance win is worth the risk :-)
> 
> Are you backing up file by file or saving backup volumes?  IE Will you have a 
> file on the backup server for each file on a live machine, or will the backup 
> machine be filled with tar files?
> 
> If you are storing tar files or similar then a umem device will provide little 
> benefit.  In which case you will probably want a machine with two PCI buses 
> and two hardware RAID cards and run software RAID-0 across them.

It's file by file, because access to the backup is very easy then. So a
umem device should be a good idea. I have to check if it's too expencive
and if we really need it. I think we have time for more than 12 hours
for making the backup.

From the debian web page:

http://packages.debian.org/testing/utils/storebackup.html

Package: storebackup 1.12.2-1
fancy compressing managing checksumming hard-linking cp -rua
Copies directory hierarchies recursively into another location, by date
(e.g. /home/ => /var/bkup/2002.12.13_04.27.56/). Permissions are
preserved, so users with access to the backup directory can recover
their files themselves.

File comparisons are done with MD5 checksums, so no changes go
unnoticed.

Hard-links unchanged backuped files to old versions and identical files
within the backuped tree. (identical means the same contents, not
depending on the same path/filename)

Compresses large files (that don't match exclusion patterns).

Manages backups and removes old ones.



