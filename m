From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: can't find a reiserfs file ssytem!
Date: Wed, 17 Mar 2004 13:10:25 +0300
Message-ID: <1079518225.2215.3.camel@tribesman.namesys.com>
References: <20040317004935.565332B2B57@ws5-7.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317004935.565332B2B57@ws5-7.us4.outblaze.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mite pascoff <ttl@linuxmail.org>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2004-03-17 at 03:49, mite pascoff wrote:
> please help:
> after a crash I can't mount my secont partition on which is located my /home dir ... 

> mount reports: "read_super_block: can't find a reiserfs file ssytem" ... 

> in the man page it says to run reiserfsck with option --rebuild-sb ... 

> am I going to lose all the data on this partition if I run reiserfsck --rebuild-sb 

No.

> and what it means "to recover a superblock on a reiserfs partition... if yes how can I save my data from being lost ?!

create a copy of that partition on spare device
dd if=problemdevice of=sparedevice
get the latest reiserfsprogs
(ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz)
reiserfsck --rebuild-sb sparedevice
reiserfsck --rebuild-tree sparedevice

Lets us know the result

