From: Steven Cole <elenstev@mesatop.com>
Subject: Re: small problem configuring and installing reiser4progs
Date: 26 Aug 2003 22:16:09 -0600
Message-ID: <1061957769.3567.6.camel@spc>
References: <3F4C052A.2010200@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F4C052A.2010200@tupshin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tupshin Harper <tupshin@tupshin.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

On Tue, 2003-08-26 at 19:11, Tupshin Harper wrote:
> I just downloaded and installed reiser4progs-0.4.12 and libaal-0.4.9. 
> This was the first install of either of these, and I ran into the 
> following problem:
> configured and make installed libaal-0.4.9
> configure of reiser4progs ends with the following:
> checking whether -falign-loops works... yes
> checking for aal_device_open in -laal... yes
> checking aal/aal.h usability... yes
> checking aal/aal.h presence... yes
> checking for aal/aal.h... yes
> checking for libaal version = 0.4.9... no
> 
> It ends there, without any indication that there was a fatal error, but 
> it didn't build the Makefiles. So, two problems...insufficient error 
> reporting, as well as a slight problem with the process. After running 
> ldconfig, configure works just fine.
> 
> -Tupshin
> 
Yeah, I flailed around with this problem for a couple of minutes too.
I also ran /sbin/ldconfig, but still got the above, so I added the
install directory for libaal (I think it is /usr/local/bin, but I don't
have it here) to /etc/ld.so.conf, and ran ldconfig again, and after that
everything worked.  I guess if I really understood this better, it
wouldn't have been even that hard, but general users shouldn't have to
jump through these hoops.

Steven

