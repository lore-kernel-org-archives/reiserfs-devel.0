From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck on PPC: checkmem fails
Date: Sat, 8 Feb 2003 15:59:25 +0300
Message-ID: <200302081559.25470.vitaly@namesys.com>
References: <3E41DD7A.5060407@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12677-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E41DD7A.5060407@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Smith <patsmith@pobox.com>
Cc: reiserfs-list@namesys.com


Hi, Patrich!

Sorry for delay, I did not work these few days. Thank you for your patch, 
I have a look at it, it seems to work right but I would like to rewrite 
it a bit, to check the whole code for similar problems and to test the result.
Could you provide me an access to your computer - I do not have a possiblity 
to test big endian code locally for now. Do you have a spare partition for 
experiments there? 

On Thursday 06 February 2003 06:58, Patrick Smith wrote:
> Yesterday, I reported having tried a experimental fix for this problem,
> that resulted in a spew of error messages.  Turns out those were due to
> a bug in my fix.  With that repaired, checkmem error message does indeed
> disappear.
>
> I've attached a patch showing what I did.  With this applied, reiserfsck
> --check produces the same error messages it did previously, minus the
> checkmem one.  It also produces one new message:
>
> 	check_and_free_buffer_mem: dirty buffer (3 16) found

this is a small inessential bug which I fixed recently - not endian related.

-- 

Thanks,
Vitaly Fertman
