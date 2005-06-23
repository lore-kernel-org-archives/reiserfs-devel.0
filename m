From: Hans Reiser <reiser@namesys.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 06:10:51 -0700
Message-ID: <42BAB4DB.9030900@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>            <p73d5qgc67h.fsf@verdi.suse.de>            <42B86027.3090001@namesys.com>            <20050621195642.GD14251@wotan.suse.de>            <42B8C0FF.2010800@namesys.com>            <84144f0205062223226d560e41@mail.gmail.com>            <42BA67C9.7060604@namesys.com> <courier.42BA6E17.00005001@courier.cs.helsinki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <courier.42BA6E17.00005001@courier.cs.helsinki.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pekka J Enberg <penberg@cs.helsinki.fi>, vs <vs@thebsh.namesys.com>
Cc: Pekka Enberg <penberg@gmail.com>, Andi Kleen <ak@suse.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Pekka J Enberg wrote:

> Hi Hans,
> On Thu, 2005-06-23 at 00:42 -0700, Hans Reiser wrote:
>
>> > These assertion codes are meaningless to the rest of us so please drop
>> > them.
>> I think you don't appreciate the role of assertions in making code
>> easier to audit and debug.
>
>
> I did not say you should drop the assertions. I referred to the
> "nikita-955" part which is redundant and pointless. Using
> __FILE__:__LINE__ (or BUG_ON even) will give you enough information to
> identify where the error occured.

but then it does not tell me who I assign the bug to.

>
> Because Reiser4 hitting an error condition and restarting the machine
> silently is silly. Just do panic() there.

Well, it seems we agreed and did not realize it.  Oh well.  The silent
restart seems like a silly option to have available.  If someone can
think of a case where it is useful, let me know, otherwise vs please
remove it.

