From: Denis Vlasenko <vda@ilport.com.ua>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sat, 17 Sep 2005 14:16:20 +0300
Message-ID: <200509171416.21047.vda@ilport.com.ua>
References: <432AFB44.9060707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432AFB44.9060707@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 16 September 2005 20:05, Hans Reiser wrote:
> All objections have now been addressed so far as I can discern.

Random observation:

You can declare functions even if you never use them.
Thus here you can avoid using #if/#endif:

#if defined(REISER4_DEBUG) || defined(REISER4_DEBUG_MODIFY) || defined(REISER4_DEBUG_OUTPUT)
int znode_is_loaded(const znode * node /* znode to query */ );
#endif

--
vda
