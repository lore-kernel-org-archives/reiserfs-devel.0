From: myciel <myciel@dotcom.pl>
Subject: Re: dead inode read from disk... ignore?
Date: Tue, 18 Nov 2003 13:04:35 +0100
Message-ID: <3FBA0AD3.90103@dotcom.pl>
References: <3FB20ACD.8080105@dotcom.pl> <16313.57788.693126.214555@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16313.57788.693126.214555@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Nikita Danilov wrote:

>myciel writes:
> > Hi
> > 
> > Few times a day I get in syslog:
> > kernel: sd(8,20):vs-13075: reiserfs_read_inode2: dead inode read from 
> > disk [11574064 47212 0x0 SD]. This is likely to be race with knfsd. Ignore
> > 
> > I just wanted to be sure: should I  really ignore this?
>
>Sorry, for delay.
>
>Yes, you should ignore it as it says.
>
>  
>
thanks

rafal



