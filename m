From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in? (let me
 quickly correct an imprecision)
Date: Tue, 17 Aug 2004 19:37:30 -0700
Message-ID: <4122C0EA.8010607@namesys.com>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com> <41210FF5.7080605@comcast.net> <4121AEAA.8050008@namesys.com> <41225C9C.7050400@comcast.net> <41226A50.3010609@namesys.com> <412298E1.4080100@comcast.net> <4122BD60.2090601@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4122BD60.2090601@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: George Beshers <gbeshers@comcast.net>, ReiserFS List <reiserfs-list@namesys.com>

Let me instead of the previous email, say:

For me, the big issue to decide at the start is, should a view 
specification be implemented with a format that is as if it is a 
subdirectory of the masked executable, and which we then take the 
filenames used by the executable and traverse the subdirectory as though 
it was root, and if we reach a valid fall through point, then allow we 
traverse from the real filesystem root, and if not, we issue a suitable 
error.

This would let us use all the semantic tree traversal code already 
written by us.

It would however require us to add such plugins as "fall through 
points", and "prints", etc.  If really lucky, you could have some 
working plugins in 4 months, and maybe have masking software done by the 
end of the contract.

I think the answer is yes, we want to do it this way, but I am going to 
think about it as I jog for an hour.  Please come up with arguments for 
and against it.

>
> Hans
>

