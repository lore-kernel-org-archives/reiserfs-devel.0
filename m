From: Oleg Drokin <green@namesys.com>
Subject: Re: old block allocator found in 2.4.19
Date: Fri, 24 Jan 2003 09:47:19 +0300
Message-ID: <20030124094719.B5039@namesys.com>
References: <5.2.0.9.2.20030123232554.02004bd8@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.2.20030123232554.02004bd8@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jan 23, 2003 at 11:30:07PM +0100, Newsmail wrote:
> Hi Oleg, as you remember I mentioned you about my loop-aes+lvm+reiserfs 
> problem, that leaves hung processes after them, and only a cold reboot 

Yes. Unfortunatelly I only produced 2.4.20+crypto stuff kernel image and
now other more important bugs and problems divert me from looking at your
problem more, sorry.

> could save a solution. well these problems came (in my opinion) after the 
> introduction of the new block allocator in 2.4.20-preX. in the first 
> version the new block allocation wasnt the default one, we had to use some 
> preallocmin= etcetc flag in the mount process. well I would like to try 
> with a new 2.4.20 kernel the settings for the old allocator. is there a way 
> to use the old allocator with the new kernel? some mount option or any?

Well, you can specify "tails=large,alloc=old_way:concentrating_formatted_nodes=10".
This way it will resemble old block allocator pretty much.
Also you can remove the new block allocator patch from 2.4.20 (just apply it
(and later fixes) with -R patch option).
Also it would be interesting if your hangs go away if you apply
iput-deadlock fix: ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/01-iput-deadlock-fix.diff

Thank you.

Bye,
    Oleg
