From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: [PATCH] updated reiser4 - reduced cpu usage for writes by writing
 more than 4k at a time (has implications for generic write code and eventually
 for the IO layer)
Date: Thu, 8 Jun 2006 16:11:32 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0606081609370.6127@yvahk01.tjqt.qr>
References: <44736D3E.8090808@namesys.com>  <b5d90b2a0605231326g5319fea8wb9efef34ee5f7ec6@mail.gmail.com>
  <6bffcb0e0605231333n612da806j9bd910cba65e3692@mail.gmail.com> 
 <1148481586.6395.25.camel@tribesman.namesys.com> 
 <Pine.LNX.4.61.0606081245160.28703@yvahk01.tjqt.qr>
 <1149770440.6336.39.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1149770440.6336.39.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Alexey Polyakov <alexey.polyakov@gmail.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <Linux-Kernel@vger.kernel.org>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Nate Diller <ndiller@namesys.com>

>> >> Any chance to get this patch against 2.6.17-rc4-mm3?
>> >yes, reiser4 updates for latest stock and mm kernels will be out in one
>> >or two days
>> There is a version out for 2.6.17-rc4-mm1, but for stock kernel? Has the latter
>> been canceled?
>There is quite fresh
>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-4.patch.gz
>
Ah thank you. I actually was looking for a /^2.6.17-rc\d+$/ dir which
explains why I did not find it :)


Jan Engelhardt
-- 
