From: Jordan Breeding <jordan.breeding@attbi.com>
Subject: Re: [QUESTION] Reiserfs 3.6.x features for 2.5.x?
Date: Tue, 01 Oct 2002 08:38:57 -0500
Message-ID: <3D99A571.7060007@attbi.com>
References: <3D99A378.70509@attbi.com> <20021001173629.A8505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11596-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:
> Hello!
> 
> On Tue, Oct 01, 2002 at 08:30:32AM -0500, Jordan Breeding wrote:
> 
> 
>>1) Correct updating of features used to mount the filesystem in the 
>>flags shown in /proc, the following code:
> 
> 
> This one will be included. It's primary intention is to enable remount to pick
> new options.
> 
> 
>>2) Attribute handling, look at this:
> 
> 
> This one will be included too.
> I am working on these two.
> 
> 
>>4) I believe there were some reiserfs 3.6.x changes which went into 
>>2.4.20-pre after the new block allocator, are these changes going to be 
>>applied to the 2.5.x tree as well?
> 
> 
> These changes were discarded in 2.4.20-pre7.
> But we plan to send these to Linus today.
> I am also working on this.
> 
> Bye,
>     Oleg
> 

Thanks, good to hear all of this.

Jordan

