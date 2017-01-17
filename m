From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Bug#850713: linux-image-4.8.0-0.bpo.2-amd64: can't mount NFS
 shares via nfs referrals
Date: Mon, 16 Jan 2017 16:32:17 -0800
Message-ID: <CAM12Q5TiKtMPOMz-Q=E2smS9iMWWFH_FTAx+Rr9NgvK1kH0gng__31659.7168254249$1484613572$gmane$org@mail.gmail.com>
References: <3654f1ee-a35d-685e-6428-70db82e8b27d@uni-mainz.de>
 <1483979321.3983.134.camel@decadent.org.uk> <508cc2b1-0aa1-a390-49d2-452342f0aef3@uni-mainz.de>
 <050869ba-0ba3-5a8f-b3db-0515634a8a36@uni-mainz.de> <1b57a517-5cdc-e93b-173b-5b56724f43f6@uni-mainz.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=8NgR3sgovczVnTH48BLl4jp7lbvXGTUYCFMdnHLrCss=;
        b=JYQJq3URjOSsn73ahILoNmAm/6uAINTJmoIzaSOStepSOiVtvtUqBoVHeJjApBgOey
         8nPdVu4wQLfvFtsHLRTqjGOsXuQrkMfKVasBcEUvB91aDRMVNs0BVaL8HLuMFewWi1Ku
         y3U2ni3vQauD1H6NC1KEKwNZMe1hiQ8yLKs/0AoQDR+T9L1cUy88lWOMrA8wKf1HUc87
         Q6xKJEhQTuoROJKHH0/Njzb1woWp2luwPdkwW34j12xdac429QVvn8ab42Jx0kuChT6m
         Qf4kK7hRm5BYQim/2NmOXtC+bRrnYKwCS8u/7DVETq6OZFgZ3NCm94c0ivSfqwg/CiaG
         ZS6g==
In-Reply-To: <1b57a517-5cdc-e93b-173b-5b56724f43f6@uni-mainz.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Martin <martin@uni-mainz.de>, 850713@bugs.debian.org
Cc: =?UTF-8?B?SsO2cmcgSMO2aGxl?= <hoehle@uni-mainz.de>

Niltze [Hello]-

'just my 2 cents':


On Mon, Jan 16, 2017 at 6:39 AM, Christoph Martin <martin@uni-mainz.de> wrote:
>
> Some more analysis:
>
> attached are two syslogs of gssd in verbose mode.
>
> You can see that in both servers the user acl directory gets mounted
> from fs02 within user context:
>
> rpc.gssd[6528]: handle_gssd_upcall: 'mech=krb5 uid=4015 enctypes
> ...
> rpc.gssd[6528]: creating context using fsuid 4015 (save_uid 0)
>
> When trying to mount the group acl share from fsgroups 4.8 server logs:
>
> rpc.gssd[27548]: handle_gssd_upcall: 'mech=krb5 uid=0 service=*
> ...
> rpc.gssd[27548]: creating context using fsuid 0 (save_uid 0)
>
> the 4.7 server logs:
>
> rpc.gssd[6528]: handle_gssd_upcall: 'mech=krb5 uid=4015
> ...
> rpc.gssd[6528]: creating context using fsuid 4015
>
>
> As a result of this difference the nfs tries to mount the directory on
> 4.7 with a user kerberos ticket and gets NFS4_OK in line 265 of
> linux-4.7-nfsrefer.dump while 4.8 tries with machine kerberos ticket and
> gets NFS4ERR_ACCESS in line 231 of linux-4.8-nfsrefer.dump.
>
> Christoph


I experienced issues installing nfs-common package from official
maintainers jessie repositories during my jessie-backport reiser4
-patched Linux kernel efforts. Accordingly I jessie-backport'ed
nfs-common and nfs-kernel-server packages that you will find at:

https://sourceforge.net/projects/debian-reiser4/files/nfs-common-reiser4-bp/

As a matter of fact just uploaded jessie-backport'ed (kerberos)
krb5-1.15-1 package that I had built priorly -- as part of my initial
efforts building first 2 packages mentioned above.

https://sourceforge.net/projects/debian-reiser4/files/jessie-krb5-1.15-1_bp/

By the way none of those packages have *any dependencies* on reiser4
other than being built in a machine with that file system ;-)

You are welcomed to give those a try but I offer no guarantees whatsoever.


Best Professional Regards.


P.S. you may need krb5-config from Sid (Unstable) -- as the above are backports.
-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Debian-Reiser4 for AMD64 https://sf.net/projects/debian-reiser4/
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
