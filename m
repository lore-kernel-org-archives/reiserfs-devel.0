From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Failed ReiserFS
Date: Thu, 10 Feb 2005 09:26:08 +0300
Message-ID: <1108016768.395.257.camel@tribesman.namesys.com>
References: <200502100535.01814.rikjoh@norweb.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502100535.01814.rikjoh@norweb.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rikard Johnels <rikjoh@norweb.se>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-02-10 at 07:35, Rikard Johnels wrote:
> Hello all.
> I am new to the list so please have patience with me for maybe asking obvious 
> questions.
> 
> I tried a recovery as described in the manpages;
>  
> talen:~ # reiserfsck --rebuild-tree -S /dev/hdc1 
> --logfile /root/reisercheck.logfile
> 

Why did you use -S?

> It ran as excpected (i hope) right up until the end where it barfed with; 
> 
> Pass 3a (looking for lost dir/files):
> Looking for lost directories:
> Looking for lost files:
> lost+found.c 348 pass_3a_look_for_lost
> look_for_lost: The entry 'lost+found' could not be found in the root 
> directory.
> Aborted
> 
> What is wrong?

You have hit reiserfsck bug.
> What can i do?

Which reiserfsck do you have?

