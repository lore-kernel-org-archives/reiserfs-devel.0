From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Drive corruption (Times two)
Date: Mon, 17 Mar 2003 16:41:29 +0300
Message-ID: <200303171641.29392.vitaly@namesys.com>
References: <Xns934140A0FF091jkonkolguidemailcom@80.91.224.249> <Xns934148E19D753jkonkolguidemailcom@80.91.224.249> <20030317162540.A19010@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030317162540.A19010@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Konkol <samba@guidemail.com>
Cc: reiserfs-list@namesys.com, Xuan Baldauf <xuan--reiserfs@baldauf.org>, baldauf@medium.net

On Monday 17 March 2003 16:25, Oleg Drokin wrote:
> Hello!
>
> On Mon, Mar 17, 2003 at 01:09:00PM +0000, Josh Konkol wrote:
> > So are you saying I'm done?  No way to recover this and I should just
> > start over again ?  This has happened on two different machines, both IBM
> > PIII machines.  If I start over again what's to say this won't happen
> > again?
>
> This is known IBM hard-drives problem. It corrupt the disk track that it
> was writing at the time of power loss. You can recover it by writing entire
> track again (all info from there is loat of course). There is even a tool
> to do that (Vitaly knows the name). There is no way from software side to
> correct the situation. Pick another HDD vendor (e.g. Seagate).

Xuan Baldauf sent us one his bash script once for recovering bad blocks. 
The script was able to recover even those blocks which did not get disappeared 
on write, you can ask him for it.

-- 

Thanks,
Vitaly Fertman
