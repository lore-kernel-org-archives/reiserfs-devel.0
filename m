From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 14:02:55 +0400
Message-ID: <17197.15183.235861.655720@gargle.gargle.HOWL>
References: <432AFB44.9060707@namesys.com>
	<200509171416.21047.vda@ilport.com.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932081AbVISLjn@vger.kernel.org>
In-Reply-To: <200509171416.21047.vda@ilport.com.ua>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Vlasenko <vda@ilport.com.ua>
Cc: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Denis Vlasenko writes:
 > On Friday 16 September 2005 20:05, Hans Reiser wrote:
 > > All objections have now been addressed so far as I can discern.
 > 
 > Random observation:
 > 
 > You can declare functions even if you never use them.
 > Thus here you can avoid using #if/#endif:
 > 
 > #if defined(REISER4_DEBUG) || defined(REISER4_DEBUG_MODIFY) || defined(REISER4_DEBUG_OUTPUT)
 > int znode_is_loaded(const znode * node /* znode to query */ );
 > #endif

It's other way around: declaration is guarded by the preprocessor
conditional so that nobody accidentally use znode_is_loaded() outside of
the debugging mode.

 > 
 > --
 > vda
 > 

Nikita.
