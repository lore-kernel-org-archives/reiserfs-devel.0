From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 14:05:12 +0200
Message-ID: <40866378.3030009@gmx.net>
References: <200404201733.51809.rmeijer@internet.gr> <200404211255.41388.vitaly@namesys.com> <200404211259.01802.rmeijer@internet.gr> <200404211547.08993.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404211547.08993.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com

Vitaly Fertman wrote:
> On Wednesday 21 April 2004 13:59, Raymond A. Meijer wrote:
> 
>>On Wed 21 April 2004 11:55, Vitaly Fertman wrote:
>>
>>>would you try this patch, it should fix the problem,
>>>email me about the result please.
>>
>>No luck... :(
> 
> 
> ok, that patch avoids such problems if you have not fsck'ed yet.

The patch didn't apply in the first place, so it of course couldn't work
(see Raymonds earlier mail).


> I have put another internal reiser4progs snapshot with some more 
> fixes into the www.namesys.com/snapshots/2004.04.21-internal.testing/
> I have no problems with it, try it please.


Carl-Daniel
-- 
http://www.hailfinger.org/

