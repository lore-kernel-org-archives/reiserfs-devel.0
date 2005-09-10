From: evilninja <evilninja@gmx.net>
Subject: Re: we have got hash function screwed up
Date: Sat, 10 Sep 2005 17:36:49 +0200
Message-ID: <4322FD91.4060404@gmx.net>
References: <431C738F.4010803@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25922-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431C738F.4010803@freemail.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Gabor HALASZ <halasz.g@freemail.hu>

Gabor HALASZ schrieb:
> Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: checking transaction log
> (dm-10)
> Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: Using rupasov hash to sort
> names

why did you choose the rupasov hash?
http://www.namesys.com/mount-options.html knows:

rupasov: [...] Never use it, as it has high probability of hash
         collisions.

-- 
BOFH excuse #234:

Someone is broadcasting pygmy packets and the router doesn't know how to
deal with them.
