From: "darren" <teodarren@myrealbox.com>
Subject: any tips on optimising samba on reiserfs?
Date: Thu, 16 Jan 2003 18:40:58 +0800
Message-ID: <000601c2bd4b$c2305720$0101a8c0@bummer>
References: <3E26838C.2030407@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E26838C.2030407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Reiserfs mail-list' <Reiserfs-List@Namesys.COM>

Hi all,

I have been trying to setup my reiserfs/samba CIFS file server on my
LAN.

Although all my benchmarks have been showing good local read write
performance, I cannot seem to get the most of it over the network with
samba.

Anyone got any tips on how I can do this?

p.s. I have already done all the obvious optimizations like TCP_NODELAY
and using SO_SNBUF=16384 blah blah..

