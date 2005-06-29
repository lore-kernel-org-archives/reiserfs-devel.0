From: Christian Rice <xian@tippett.com>
Subject: Re: XFS corruption during power-blackout
Date: Wed, 29 Jun 2005 09:38:48 -0700
Message-ID: <42C2CE98.3020504@tippett.com>
References: <200506290453.HAA14576@raad.intranet>
Reply-To: xian@tippett.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506290453.HAA14576@raad.intranet>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Al Boldi <a1426z@gawab.com>
Cc: 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Al Boldi wrote:

>Hi Nathan,
>You wrote: {
>On Tue, Jun 28, 2005 at 12:08:05PM +0300, Al Boldi wrote:
>  
>
>>True now, not so around 2.4.20 when XFS was rock-solid. I think they 
>>tried to improve on performance and broke something. I wish they would 
>>fix that because it forced me back to ext3, as in consistency over 
>>performance any time.
>>    
>>
>
>Can you provide any details...
>}
>
>Specifically, in 2.4.20 I did an acid test:
>Spawn 10 cp -a on some big dir like /usr.
>Let it run for a few seconds, then pull the plug.
>Don't reset-button, reset is different then pulling the plug.
>Don't poweroff-button, poweroff is different then pulling the plug.
>On reboot diff the dirs spawned.
>
>What I found were 4 things in the dest dir:
>1. Missing Dirs,Files. That's OK.
>2. Files of size 0. That's acceptable.
>3. Corrupted Files. That's unacceptable.
>4. Corrupted Files with original fingerprint. That's ABSOLUTELY
>unacceptable.
>
>Ext3 performed best with minimal files of size 0.
>XFS was second  with more files of size 0.
>Reiser,JFS was worst with corruptions.
>
>When XFS was added into the vanilla-Kernel it caused corruptions like Reiser
>and JFS, which forced me back to Ext3.
>
>
>
>  
>
Pardon me if I haven't seen the whole thread.

Do you have hard drive write cache turned off or, if it's a raid card, a 
battery backup on the write cache?  That makes a big difference when 
operators begin doing things like pulling plugs and hitting reset.

Again, no offense, just one of those "have you taken it out of the box, 
plugged it in and turned it on" kind of questions.
