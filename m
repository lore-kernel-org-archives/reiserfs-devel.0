From: Oleg Drokin <green@namesys.com>
Subject: Re: Drive corruption (Times two)
Date: Mon, 17 Mar 2003 16:25:40 +0300
Message-ID: <20030317162540.A19010@namesys.com>
References: <Xns934140A0FF091jkonkolguidemailcom@80.91.224.249> <78405142796.20030317134605@tnonline.net> <Xns934148E19D753jkonkolguidemailcom@80.91.224.249>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Xns934148E19D753jkonkolguidemailcom@80.91.224.249>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Konkol <samba@guidemail.com>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

Hello!

On Mon, Mar 17, 2003 at 01:09:00PM +0000, Josh Konkol wrote:
> So are you saying I'm done?  No way to recover this and I should just start 
> over again ?  This has happened on two different machines, both IBM PIII 
> machines.  If I start over again what's to say this won't happen again?  

This is known IBM hard-drives problem. It corrupt the disk track that it was writing
at the time of power loss. You can recover it by writing entire track again (all info
from there is loat of course). There is even a tool to do that (Vitaly knows the name).
There is no way from software side to correct the situation. Pick another HDD vendor
(e.g. Seagate).

Bye,
    Oleg
