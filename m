From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 15:12:21 -0700
Message-ID: <432DE645.6090308@namesys.com>
References: <432AFB44.9060707@namesys.com> <200509171416.21047.vda@ilport.com.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509171416.21047.vda@ilport.com.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Vlasenko <vda@ilport.com.ua>, Alexander Zarochentcev <zam@namesys.com>
Cc: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Denis Vlasenko wrote:

>On Friday 16 September 2005 20:05, Hans Reiser wrote:
>  
>
>>All objections have now been addressed so far as I can discern.
>>    
>>
>
>Random observation:
>
>You can declare functions even if you never use them.
>Thus here you can avoid using #if/#endif:
>
>#if defined(REISER4_DEBUG) || defined(REISER4_DEBUG_MODIFY) || defined(REISER4_DEBUG_OUTPUT)
>int znode_is_loaded(const znode * node /* znode to query */ );
>#endif
>
>--
>vda
>
>
>  
>
thanks.

zam, please address this.
