From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.4.19-pre7 / corruption on unwanted reboot
Date: Mon, 06 May 2002 14:59:10 +0400
Message-ID: <3CD661FE.5080500@namesys.com>
References: <20020504211147.GA20092@matrix.wg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dirk Mueller <dmuell@gmx.net>
Cc: reiserfs-list@namesys.com

Dirk Mueller wrote:

>Hi, 
>
>I've seen HEAVY file corruption on unwanted reboots (like pressing the reset 
>button accidently) on reiserfs with this kernel on 3 machines now. 
>
>The symptom is that it finds a LOT of files to "unlink" on journal replay, 
>which I find suspicious as those machines are lightly loaded. 
>
>I didn't follow the development too closely the last few weeks, but I 
>believe that something turned worse in this respect lately. 
>
>Note that reiserfsck doesn't find any error in the file system structure 
>before and after the journal replay on reboot, 
>still many files (especially those that were not touched for several hours 
>before the reboot) contain complete garbage after the journal replay. 
>
>
>Dirk
>
>
>  
>
Were these files being written to near the time of the reboot?

hans


