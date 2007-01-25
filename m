From: Vince <fuzzy77@laposte.net>
Subject: Re: linux-2.6.20-rc4-mm1 Reiser4 filesystem freeze and corruption
Date: Thu, 25 Jan 2007 08:33:28 +0100
Message-ID: <45B85D48.9080403@laposte.net>
References: <1169229490.6266.11.camel@oberon> <45B5BB5E.4010802@laposte.net> <200701232215.37321.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200701232215.37321.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

Vladimir V. Saveliev wrote:
> Hello
> 
> On Tuesday 23 January 2007 10:38, Vince wrote:
[...]
>> I don't know if it is related, but I've had the following BUG on 
>> 2.6.20-rc4-mm1 (+ hot-fixes patches applied) :
>>
>> -------------------
>> kernel BUG at fs/reiser4/plugin/item/extent_file_ops.c:973!
> 
> This is another problem than Zan's one. The attached patch should fix it.
> 
> Andrew, please apply.
> 
> 
> From: Vladimir Saveliev <vs@namesys.com>
> 
> remove_suid may open a transaction in reiser4 which is to be restarted
> before entering into main write loop.
> 
> Signed-off-by: Vladimir Saveliev <vs@namesys.com>

I'm pleased to confirm I wasn't able to reproduce the bug with your 
patch applied.

Regards,

Vince
