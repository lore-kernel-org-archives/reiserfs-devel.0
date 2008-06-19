From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Maintainer
Date: Fri, 20 Jun 2008 01:56:10 +0400
Message-ID: <485AD5FA.7090809@gmail.com>
References: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Todd Slack" <mailinglists@jasonandannette.us>
Cc: reiserfs-devel@vger.kernel.org

J. Todd Slack wrote:
> Hello All,
>

Hello.

> I have spend a long time over the last years studying Reiser 3 and
> Reiser4.
>
> How would I go about becoming the new Reiser maintainer?
>
> I would like to work on changing Reiser appropriately to get accepted
> in the the kernel. I am sure that I am not aware of all issues at this
> point, but I have known of some issues.
>
> I have attempted to contact Edward Shishkin, but no response.

Yeah, sometimes I can not reply immediately..

>
> Would anyone have thoughts?

Ok, let's start with #14
Since google dropped the cache, pull it as the first item of this list:
http://lkml.org/lkml/2006/8/3/38 (about set_page_dirty_internal).

Also there is a small, but nasty leak of free disk space when process
runs in
no-space-left-on-device mode. It can be reproduced by the following way:

1) format a small partition by mkfs.reiser4 with no options;
2) mount it and look at "df" output;
3) run stress.sh -n 20; let it to work some time with complaints about
no space left on device;
4) terminate stress benchmark and remove everything on the partition;
5) sync and look at "df" output: it can show more used space, then it
was reported at (2).

It would be great to fix this leak.
There is a hint: this leak is related to tail conversion (if you format
a partition with "extents only" policy, then it doesn't take place).

Thanks,
Edward.

