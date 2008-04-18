From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 - extended attributes?
Date: Fri, 18 Apr 2008 23:03:43 +0400
Message-ID: <4808F08F.5040707@gmail.com>
References: <alpine.LRH.1.00.0802201656050.6228@skynet.shatteredsilicon.net> <47BC6692.4090905@gmail.com> <alpine.LRH.1.00.0802201748170.6726@skynet.shatteredsilicon.net> <47bc6c10.03eb300a.57b7.ffff8e27@mx.google.com> <47BCA1E0.9050408@bobich.net> <47bcc14d.0c53300a.2288.ffffb39c@mx.google.com> <alpine.LRH.1.00.0802210922120.5782@skynet.shatteredsilicon.net> <47BD55CA.6070902@gmail.com> <47BD5FBC.1000507@gmail.com> <alpine.LRH.1.00.0802211132030.9972@skynet.shatteredsilicon.net> <47bd6762.2115300a.460a.44d6@mx.google.com> <alpine.LRH.1.10.0804181512110.5129@skynet.shatteredsilicon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.1.10.0804181512110.5129@skynet.shatteredsilicon.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: gordan@bobich.net
Cc: Maverick <maverick.pt@gmail.com>, Bartosz Szreder <cfiend@talent.edu.pl>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hello.
Xattrs are not yet supported in Reiser4.
Bartosz had a desire to devote some time for them, but I guess it is not 
yet ready.

Cc-ed the mailing list: maybe someone knows how to bypass xattrs
when implementing GlusterFS..

Thanks,
Edward.

gordan@bobich.net wrote:

> Hi,
>
> My apologies for bothering you again, but I couldn't find any reiser4 
> mailing lists to ask on.
>
> I'm trying to implement GlusterFS on top of Reiser4, and it is 
> complaining that the underlying FS (i.e. Reiser4) doesn't support 
> extended attributes. I have seen references to Reiser4 that say 
> otherwise, so I was wondering if there is a patch/fix that would make 
> the extended attributes work. I'm using the cc plugin with 
> compression. Is there a working implementation with extended 
> attributes? Or is my only option to move to a different underlying FS 
> type?
>
> Thanks.
>
> Gordan
>

