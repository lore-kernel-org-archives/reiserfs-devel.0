From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Tue, 18 Jul 2006 18:38:10 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0607181835020.24589@yvahk01.tjqt.qr>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it>
 <E1G1QFx-0001IO-K6@be1.lrz> <44B7D97B.20708@suse.com> <44B9E6D5.2040704@namesys.com>
 <44BA61A2.5090404@suse.com> <44BA8214.7040005@namesys.com> <44BABB14.6070906@suse.com>
 <44BAE619.9010307@namesys.com> <44BAECE2.8070301@suse.com> <44BAFDC3.7020301@namesys.com>
 <44BB0146.7080702@suse.com> <44BB3C42.1060309@namesys.com> <44BBA4CF.8020901@suse.com>
 <44BBD4B6.5020801@namesys.com> <44BBD942.3080908@suse.com> <44BBDFFC.70601@namesys.com>
 <44BBEC17.8020507@suse.com> <44BBFB0D.6040105@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44BBFB0D.6040105@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

>
>Try v4.
>
>> My original xattr
>> implementation added another item type, but oh -- wait -- it turns out
>> that the file system isn't quite as extensible as claimed.. or, well, AT
>> ALL. Adding another item results in an incompatible file system change
>> that when mounted on another system, will panic the node. That's
>> friendly! There's not even any way to identify which items are in use on
>> a particular file system to issue a warning/error on mount. Outstanding
>> job "architecting" there.
>
>Well, if you had an obsessive desire to not use V4, you could fix this
>in V3 instead.
>
>Might be easier to use V4...
>
>> Users
>> wanted ACLs and xattrs on reiser3, but you said, "wait for v4, it'll be
>> out soon, and it'll have them." That was 4 years ago. Reiser4 still
>> isn't completely stable 

My word here is done:

While reiserfs3 actually got ACLs, xattrs and quota support by now, reiser4
still lacks them. Something must be very wrong to suggest V4; at least when it
comes to these three things.


Jan Engelhardt
-- 
