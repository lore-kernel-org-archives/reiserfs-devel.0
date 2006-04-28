From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 problem deleting files / directories
Date: Fri, 28 Apr 2006 19:23:56 +0400
Message-ID: <1146237836.6288.32.camel@tribesman.namesys.com>
References: <44517AF4.9010405@nusconsulting.com.au>
	 <44523319.4000503@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44523319.4000503@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>
Cc: reiserfs-list@namesys.com, Daniel Kasak <dkasak@nusconsulting.com.au>

Hello

On Fri, 2006-04-28 at 17:22 +0200, Michael Weissenbacher wrote:
> Hi,
> > I just ran out of space while compiling, and went to delete everything 
> > in /var/tmp/portage. I get the error:
> > 
> > rm: reading directory 
> > `/var/tmp/portage/nautilus-2.12.2//work/nautilus-2.12.2/cut-n-paste-code': 
> > Input/output error
> > rm: cannot remove directory 
> > `/var/tmp/portage/nautilus-2.12.2//work/nautilus-2.12.2': Directory not 
> > empty
> just to confirm, i had the same error. i thought it would be unrelated 
> to the partition filling up but reading your post i do believe otherwise 
> now. in my case i restored my fs from a recent backup.
> 
> could it really be that a released filesystem (reiser4) cannot handle a 
> partition that's filled up to the max without damaging filesystem 
> structures? can somebody from the reiser4 crew comment on this?
> 

some time ago we did such tests and evreything was fine.
We will do more similar tests however.
 


