From: Oleg Drokin <green@namesys.com>
Subject: Re: lvm+loop-aes+reiserfs / iput deadlock fix
Date: Tue, 28 Jan 2003 09:40:39 +0300
Message-ID: <20030128094039.B32093@namesys.com>
References: <5.2.0.9.2.20030127000631.01d7a068@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.2.20030127000631.01d7a068@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jan 27, 2003 at 12:11:37AM +0100, Newsmail wrote:

> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/01-iput-deadlock-fix.diff 
> patch on 2.4.20aa1 and this patch DOES improve the situation.

That's good... and bad.

> Before I used the patch when I made heavy copying of 10-50 meg files, after 
> some time the copying process hung, and WASN'T killable. And also it left 
> files that werent deletable, and also left the deleting process hung. and 
> many times I wasnt even able to acces the folder where the strange file was 
> located.
> Now with the iput deadlock fix, the copying process does hang as well, BUT 
> it is killable after, and the 'fucked up' file is deletable also.

That is clear sign of problems at new_inode() stage (something propagated from block level, I think).
And given that you do not have space shortage and any unusual kernel messages...
This is very strange.
Where does process hang this time? (press SysRQ-T, decode the output and send it to me)

Bye,
    Oleg
