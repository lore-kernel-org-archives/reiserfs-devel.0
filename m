From: Oleg Drokin <green@namesys.com>
Subject: Re: crashing FS.. please help
Date: Thu, 20 Jun 2002 20:19:41 +0400
Message-ID: <20020620201941.A1336@namesys.com>
References: <1024570431.1143.29.camel@detrius>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1024570431.1143.29.camel@detrius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik B?gfors <erik@bagfors.nu>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 20, 2002 at 12:53:51PM +0200, Erik B?gfors wrote:

> [root@egon /]# reiserfsck /dev/hdb1
> reiserfsck, 2001 - reiserfsprogs 3.x.0j
> Will read-only check consistency of the partition
> Will put log info to 'stderr'
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> reiserfs_open: bread failed reading bitmap #1 (32768)

Sounds like I/O errors of some kind. You'd better inspect logs once
you come home.

> At this point the login to the machine stopped so I really can't do
> anything else until I'm home.

Hmm.. HDD is busy trying to read bad blocks?

> Is there anyway to save this filesystem??  I really don't care if I can
> access the whole fs I just want to get my digital pictures back.  There
> are 1000s of pictures on that disk that i NEED.

If HDD went dead, there is not much we can do. (but there are companies
specialising on reviving broken HDDs out there).
We need excerpts from your log files anyway.

Bye,
    Oleg
