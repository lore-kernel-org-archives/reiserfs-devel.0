From: Oleg Drokin <green@namesys.com>
Subject: Re: What does this mean?
Date: Mon, 8 Jul 2002 19:09:23 +0400
Message-ID: <20020708190923.A928@namesys.com>
References: <3D2993E5.6030707@tpg.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10928-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D2993E5.6030707@tpg.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Basil Chupin <blchupin@tpg.com.au>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jul 08, 2002 at 11:30:13PM +1000, Basil Chupin wrote:

> I am running SuSE 8 and the HD is being accessed every 5 seconds by 
> "something". I thought I would just do a quick check of the reiserfs but 

atime updates and stuff?

> on executing "reiserfsck --check --logfile check.log  /dev/hda7" this 
> produces the error message "/dev/hda7 is mounted w/ write permissions, 
> can not check it." I cannot find this message documented so am wondering 
> what it means, and what do I need to do in order to be able to check the 
> integrity of the reiserfs on my sytem. Can anyone please help?

You can only check integrity on read-only mounted fs.
You can only fix stuff on completely unmounted fs.

Bye,
    Oleg
