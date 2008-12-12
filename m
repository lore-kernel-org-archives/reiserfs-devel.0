From: Mat <jackdachef@gmail.com>
Subject: Re: The reiser4 programming style is recursive?
Date: Fri, 12 Dec 2008 16:48:29 +0000 (UTC)
Message-ID: <loom.20081212T164507-528@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

>Edward Shishkin Thursday 11 December 2008 23:56:
>>> there is no reiser4 transaction manager in place with just
>>> the patches, right ?
>> Its code can be found in reiser4/txnmgr.c

>And is this activated or not ready disabled code?

Hi Ralph,

are you actually using Reiser4 ?

the following tools might be helpful in observing reiser4 during its work:

iotop
htop
atop
...

that way you'll see that (I might err) txnmgr is doing its job during
transactions / i/o stuff

Cheers

Mat

