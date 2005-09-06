From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: we have got hash function screwed up
Date: Tue, 06 Sep 2005 13:10:53 +0400
Message-ID: <431D5D1D.2090709@namesys.com>
References: <431C738F.4010803@freemail.hu> <b14e81f00509051031158e3f0e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00509051031158e3f0e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: thenewme91@gmail.com, Gabor HALASZ <halasz.g@freemail.hu>
Cc: reiserfs-list@namesys.com

Hello

michael chang wrote:
> On 9/5/05, Gabor HALASZ <halasz.g@freemail.hu> wrote:
> 
>>root@sk8n:~# touch
>>/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb
>>touch: cannot touch
>>`/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb':
>>Device or resource busy
> 
>>What can I do?!
> 

Can you send output of ls /home/ftpd/pub/debian/pool/main/x/xorg-x11/ ?
You should be able to create this file in other directory. Or create file with other name in that directory.
