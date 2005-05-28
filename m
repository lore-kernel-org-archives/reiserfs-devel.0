From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: My reiserfs module crash...
Date: Sat, 28 May 2005 10:10:42 +0400
Message-ID: <1117260642.7263.214.camel@tribesman.namesys.com>
References: <1117205926.7083.189.camel@tribesman.namesys.com>
	 <200505271917.31290.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505271917.31290.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly <vitaly@namesys.com>
Cc: Greg Burri <greg@euphorik.ch>, reiserfs-list@namesys.com

Hello

On Fri, 2005-05-27 at 19:17, Vitaly wrote:
> > Hi !
> > I have done "debugreiserfs -p" to collect metadata .. .I take me about 
> > 15 hours but its ok.
> > I have put the file here :
> > http://www.euphorik.ch/boardel/debugreiserfs_metadata.bz2 (23Mo)
> 
> unfortunately I have failed to unpack metadata, they got corrupted 
> somehow, but I see at least that fs is not consistent and you need 
> to run
> 	reiserfsck --rebuild-tree -l logfile <device>
> to fix it.
> 
> there is also a problem with reiserfs module crash on mounting 
> such a partition,

that is on mounting the partition before reiserfsck --rebuild-tree. When
reiserfsck will complete - it should mount properly.

>  we are working on the fix.
>  
> > I wish that someone can help me, I don't want to loose all my data :'(
> > 
> > bye !
> > Thanks by advance
> > 
> > Greg Burri
> 

