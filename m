From: Chris Mason <mason@suse.com>
Subject: Re: Quota problem
Date: 13 May 2002 10:07:07 -0400
Message-ID: <1021298827.16587.87.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020513085414.A32129@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Rasmus B?g Hansen <moffe@amagerkollegiet.dk>, ReiserFS Mailing List <reiserfs-list@namesys.com>

On Mon, 2002-05-13 at 00:54, Oleg Drokin wrote:
> Hello!
> 
> On Fri, May 10, 2002 at 03:13:18PM +0200, Rasmus B?g Hansen wrote:
> 
> > May  6 12:39:03 carlsberg kernel: VFS: find_free_dqentry(): Data block full but it shouldn't.
> > May  6 12:39:03 carlsberg kernel: VFS: Error -5 occured while creating quota.
> 
> error -5 means I/O error.
> Any reiserfs related messages in logs?
> 
> Also please try to run latest reiserfsck on that partition and see if it finds
> any problems.

Running quotacheck should fix the errors.  You'll need to run it after
each crash.

-chris


