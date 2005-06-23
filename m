From: Jeff Mahoney <jeffm@suse.de>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 15:29:29 -0400
Message-ID: <42BB0D99.7070703@suse.de>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>	<p73d5qgc67h.fsf@verdi.suse.de>	<42B86027.3090001@namesys.com>	<20050621195642.GD14251@wotan.suse.de>	<42B8C0FF.2010800@namesys.com>	<84144f0205062223226d560e41@mail.gmail.com>	<42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050623114318.5ae13514.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: penberg@gmail.com, reiser@namesys.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, penberg@cs.helsinki.fi

Andrew Morton wrote:
> Jeff Mahoney <jeffm@suse.de> wrote:
>>>>+	assert("nikita-955", pool != NULL);
>> > 
>> > These assertion codes are meaningless to the rest of us so please drop
>> > them.
>>
>> As someone who spends time debugging reiser3 issues, I've grown
>> accustomed to the named assertions. They make discussing a particular
>> assertion much more natural in conversation than file:line.
> 
> __FUNCTION__?

__FUNCTION__ gives additional context, sure, but it doesn't address one
 of the main advantages of numbered assertions: the ability to track the
same assertion across different versions without having to verify that
it is indeed the same assertion on every one. The line number can still
change very easily, and if there are several assertions in a row, it's
not immediately obvious (at a glance) that it is the same assertion.
Reiser[34] warnings use the same mechanism.

I do agree that some pain comes with it, you can end up with assertion
numbers that are all over the place or you start by spreading them out
in a manner we all thought we left behind when we moved beyond BASIC.
I'm not totally committed to it, I just wanted to address the assumption
that numbered assertions were worthless to the rest of the world.

However, I do want to take a moment to address what I think is a bigger
issue in the code. Perhaps it's not enough to be a barrier to inclusion,
but since I'm going through the reiser3 code and addressing these now, I
thought I'd mention them.

All the assertions (a quick grep through the code shows something like
3800 of them) ultimately result in a reiser4_panic, which BUG()'s. Are
*all* of these assertions really worth taking the system down? I think a
reiser4_error function that can abort just that filesystem and recover
somewhat gracefully would be a bit more in order.

-Jeff

-- 
Jeff Mahoney
SuSE Labs
