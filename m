From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: 2.4.20 and data logging
Date: Wed, 04 Dec 2002 00:01:53 +0100
Message-ID: <3DED37E1.9030400@mb.tu-ilmenau.de>
References: <200212031238.32403.russell@coker.com.au> <1038932472.1508.4.camel@tiny> <17043452890.20021203231413@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12097-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

On 12/03/2002 11:14 PM, Anders Widman wrote:
>>On Tue, 2002-12-03 at 06:38, Russell Coker wrote:
>>
>>>How is data logging work going?  Is there a patch for 2.4.20?
>>
>>I'm trying to sort out a complete fix for the transaction overflow bug
>>Philippe hit, but other than that the patches are considered stable.
> 
> Are these complete and working yet?

As of 2.4.20-rc3 they work well. The one and only 
transaction-overflow-fix was posted by Chris on 11/14/02 to our list.
I haven't tried the combo with 2.4.20-final, yet.

The patches still need the "rootflags=data=[ordered,journal]" append 
addon for booting the root fs / if you don't want the standard mode 
"writeback" (you don't, if you want the data-logging ;-)  ).

I hope Chris would remove this "security feature" as soon as possible 
when he now considers the patches to be stable and said the pending bug 
is supposed to be hit very rarely.


Manuel

>>You can find 2.4.20 patches in
>>ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20
>>
>>-chris

