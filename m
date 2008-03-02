From: John <geearf@free.fr>
Subject: Re: No space left on rfs4
Date: Sun, 2 Mar 2008 22:53:31 +0100
Message-ID: <cd2131fe2e8cdce7c68183211d98bc90@free.fr>
References: <47CA7EA8.8070802@gmail.com>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47CA7EA8.8070802@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org



On Sun, 02 Mar 2008 13:17:12 +0300, Edward Shishkin <edward.shishkin@gmail.com> wrote:
> Hello.
> 
> Yeah, indeed, I have reproduced it for reg40 (default plugin):
> tar process is in permanent "+D" state. After reboot all files
> were successfully deleted, although there is some leak of free
> disk space there.
> 
> Ok, I'll take a look at this more carefully (I guess -ENOSPC
> error is handled incorrectly somewhere).
> 
> If you have a problems with deleting files on reg40 partition,
> then please pack your metadata by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz
My FS is currently no full and with no bug, so I hope these are the metadata you wanted.
If not I'll fill it again and send it to you again

http://www.megaupload.com/?d=XVITV1CU

(sorry I cannot send a file that big by e-mail)
> 
> I don' t see such problems with ccreg40 (compression plugin).
> Please, let me know, if something goes wrong here..
I just tried and had the same issue with a ccreg40 partition.
I could not remove all the files, and when I tried it just froze my shell.
After killing my shell I was able to reboot but not to umount the partition.
This is the debugfs output:

http://www.megaupload.com/?d=CBEGIFDL


I also wanted to join an fsck output but I don't know how to do that.
Basically the results were in checking the semantic tree
FSCK: obj40_repair.c 223: obj40_stat_unix_check: Node (XYZ), item (a), [fgfdgf:fgfdggdf:fhgfhgf] (stat40): wrong bytes (ABCDE), fixed to (EFC).

(obviously this is some sort of templated message, they were all like that...)


Thank you,

John

