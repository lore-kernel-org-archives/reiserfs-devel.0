From: Andrew Wade <mscibing@yahoo.com>
Subject: Re: crash while processing safelinks caused by i_count==1
Date: Tue, 29 Mar 2005 11:01:25 -0500 (EST)
Message-ID: <20050329160125.19117.qmail@web50203.mail.yahoo.com>
References: <1112106167.4766.484.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112106167.4766.484.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

 --- Vladimir Saveliev <vs@namesys.com> wrote: 
> Please try to mount with attached patch.

That fixed it, thanks.

First mount had "Unlinked inode" warnings, subsequent mounts
nothing, fsck gives the fs a clean bill of health, and I
haven't noticed any further problems while using it.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
