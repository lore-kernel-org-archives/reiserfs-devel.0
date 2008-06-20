From: "J. Todd Slack" <mailinglists@jasonandannette.us>
Subject: Re: Reiser4 Maintainer
Date: Fri, 20 Jun 2008 12:25:06 -0700
Message-ID: <15E87432-4EBE-4268-B312-3F84E4D065E4@jasonandannette.us>
References: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us> <485AD5FA.7090809@gmail.com>
Mime-Version: 1.0 (Apple Message framework v924)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <485AD5FA.7090809@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi,

>> I have attempted to contact Edward Shishkin, but no response.
>
> Yeah, sometimes I can not reply immediately..

OK, I was just thinking that you did not exist anymore. No worries.

>> Would anyone have thoughts?
>
> Ok, let's start with #14
> Since google dropped the cache, pull it as the first item of this  
> list:
> http://lkml.org/lkml/2006/8/3/38 (about set_page_dirty_internal).
>
> Also there is a small, but nasty leak of free disk space when process
> runs in
> no-space-left-on-device mode. It can be reproduced by the following  
> way:
>
> 1) format a small partition by mkfs.reiser4 with no options;
> 2) mount it and look at "df" output;
> 3) run stress.sh -n 20; let it to work some time with complaints about
> no space left on device;
> 4) terminate stress benchmark and remove everything on the partition;
> 5) sync and look at "df" output: it can show more used space, then it
> was reported at (2).
>
> It would be great to fix this leak.
> There is a hint: this leak is related to tail conversion (if you  
> format
> a partition with "extents only" policy, then it doesn't take place).

So who is the maintainer at this point? Is there a vacancy?

-Jason

