From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: 2.6.9-mm1
Date: Mon, 25 Oct 2004 16:07:11 -0400
Message-ID: <417D5CEF.8080005@tmr.com>
References: <417B1574.4090406@slaphack.com><417B1574.4090406@slaphack.com> <417B3A34.2060306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <417B3A34.2060306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, =?ISO-8859-1?Q?Markus_T=F6rnqvi?= =?ISO-8859-1?Q?st?= <mjt@nysv.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hans Reiser wrote:
> David Masover wrote:
> 
>>
>> Some people don't care about speed but need space.  I'd leave them in on
>> general principle, even if no one wants them now.
> 
> 
> Software design is usually improved by identifying features that aren't 
> worth much, and removing them from the interface and burying them where 
> average users don't see them (or dumping them completely).  Interface 
> clutter has a cost.

We already have a section of odd things a user might want to do on a 
small, embedded, or special use. That might be a good place to put it.

-- 
    -bill davidsen (davidsen@tmr.com)
"The secret to procrastination is to put things off until the
  last possible moment - but no longer"  -me
