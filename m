From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs4 & cleaner process
Date: Thu, 05 Jun 2003 18:29:08 +0400
Message-ID: <3EDF53B4.60705@namesys.com>
References: <20030605132903.GB22392@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030605132903.GB22392@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

Cyrille Chepelov wrote:

>Hi all,
>
>I've seen several statements recently to the effect that Reiserfs4 is going
>to start beta time in July (I wish there were patches available now 
>against current 2.5 kernel rather than BK, but I guess that considering that
>I'm unable to bri^Wfund such a "project" and I'd rather have beta patches 
>earlier than having snapshot patches right now, all's fine).
>
>However, one point is unclear to me at this point: there are numerous
>mentions of a "cleaner" process (whatever the terminology) in the published 
>reiser4 design documents. Does the July timeframe apply to this component
>too, or is it for later?
>
>Thanks in advance,
>
>	-- Cyrille
>  
>
4.1 will have the cleaner, and we will write it after we finish the 
semantic enhancements still remaining to be done in our DARPA contract.  
It is however the highest priority for the post-DARPA contract work.  I 
hope that the cleaner will ship in October.

-- 
Hans


