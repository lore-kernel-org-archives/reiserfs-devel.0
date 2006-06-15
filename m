From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfschk --rebuild-tree was aborted, said disk was full
Date: Thu, 15 Jun 2006 12:24:28 +0400
Message-ID: <1150359868.6313.23.camel@tribesman.namesys.com>
References: <44910927.5030500@oddjob.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28786-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44910927.5030500@oddjob.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johan Isacsson <johan@oddjob.se>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-06-15 at 09:15 +0200, Johan Isacsson wrote:
> reiserfschk --rebuild-tree was aborted when it nearly had finished pass 
> 1 and now i can't mount the partition.
> I no longer have the exact error message.
> 
> Just before the filesystem got bad we had removed lots of data because 
> the disk got full. Df then reported that there was lots of space left on 
> that partition.
> After that we had to power cycle the server because it got hung up and 
> after the reboot df reborted 100% usage and that some files couldn't be 
> read.
> I den did a reiserfschk --check which said there wer fatal errors and 
> that i needed to do a rebuild-tree, which i did.
> And after a long while it was aborted at about 90% of pass 1.
> 
> I have the version 3.6.19-2 of reiserfs-progs (FC 4).
> Of course i read about taking a backup after i had done the 
> --rebuild-tree :(
> 
Please, let us see complete reiserfsck --rebuild-tree output.

