From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 07:47:33 +1000
Message-ID: <1127166454.4386.12.camel@gaston>
References: <432AFB44.9060707@namesys.com>
	 <200509171416.21047.vda@ilport.com.ua>
	 <17197.15183.235861.655720@gargle.gargle.HOWL>
	 <feed8cdd05091912362ac13f3e@mail.gmail.com>
	 <17199.10558.939696.765980@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26096-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17199.10558.939696.765980@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: stephen.pollei@gmail.com, Alexander Zarochentcev <zam@namesys.com>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>


> Maybe, but kernel developers are supposed to watch for compiler
> messages. People who use that technique definitely do.

You are making no sense. If the function isn't defined, it will break at
link time or depmod time instead of compile time, big deal... get rid of
those useless #ifdef's please.

Ben.


