From: aquadog <aquadog@fbsd.za.net>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Sun, 11 Apr 2004 18:26:32 +0200
Message-ID: <407971B8.9090202@fbsd.za.net>
References: <1081698647.5514.3.camel@redeeman.linux.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081698647.5514.3.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: redeeman@metanurb.dk, reiserfs-list@namesys.com

I'm having the exact same problem. Doing a gentoo stage1 install,
and it fails on glibc every time. Exact same configuraiton on reiser3 
partition and it works no problem.

It happens while making a call to syscall.h and returns a "nested too 
deep" error.

Used all the latest patches I got from namesys.com.

Redeeman wrote:
> im very sorry to announce it, but i found a bug :(
> 
> glibc wont compile on a reiser4 filesystem, it makes no sense at all,
> but it wont. :( PLEASE tell me its not reiser4's fault!
> 
> 

