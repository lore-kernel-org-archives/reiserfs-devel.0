From: Hans Reiser <reiser@namesys.com>
Subject: Re: The x Bit Problem
Date: Fri, 05 Dec 2003 15:44:37 +0300
Message-ID: <3FD07DB5.6090708@namesys.com>
References: <16333.14692.61778.304155@pc7.dolda2000.com>	 <3FCD47C4.50500@ninja.dynup.net> <3FCE39B8.20307@namesys.com>	 <16334.15412.686909.927196@laputa.namesys.com> <1070580817.8344.140.camel@arabia.home.lan> <3FD00086.90607@ninja.dynup.net> <3FD01679.3040007@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD01679.3040007@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Grant Miner wrote:

> An interesting thing I discovered is that Windows simply ignores the 
> 'x' bit (I should say the Windows equivalent of the 'x' bit, called 
> "traverse folder / execute file"), but there is a policy setting that 
> overrides this attribute.
>
> I know users get tripped up on this a lot in Unix, like when they 
> don't understand why the webserver can't read their public_html 
> directory.  It might be a good option for Linux.
>
>
>
The right solution is to have a separate readdir permission, so that a 
file-directory can be not executable but be listable, and vice-versa.  
The problem comes from overloading the bit and also changing whether 
objects can be simultaneously files and directories.

-- 
Hans


