From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: Problem with Reiser4
Date: Fri, 16 Dec 2005 00:46:09 +0100
Message-ID: <43A20041.2070309@ursynow.2a.pl>
References: <20051216004042.7014fa68.tobi.kunze@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051216004042.7014fa68.tobi.kunze@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tobi Kunze <tobi.kunze@gmail.com>
Cc: reiserfs-list@namesys.com

Tobi Kunze wrote:
> Hi,
> 
> i have a strange problem with my system and i think it might be caused by reiser4. If i write a file with vim, even if it is just a word, my harddisk starts to write like mad for a few seconds and vim is not responding. The problem does not exist with nano or emacs. One might now guess it is a vim problem, but it behaves totally normal if i write the file on a fat32 partition on the same disk. Vim just quits and i even cannot hear my harddisk write. Another reason why i think it is a reiser problem is that dpkg got really slow with the last few kernels. It takes very long to extract and install the deb packages.
> 
> At the moment i am using Debian and 2.6.14.1 vanilla with reiser4 patch. The problem also exists on 2.6.14-mm2.
> 
> With kind regards
> 
> Tobias Kunze
> 
> 

try to remount your reiser4 partition with noatime,nodiratime options, 
it should help.

(it will still be a little slower that what it used to be, but much 
better anyways)



