From: Shoshannah Forbes <xslf@xslf.com>
Subject: Re: rebuild-tree working for more then 3 days- what to do?
Date: Fri, 07 Jan 2005 14:11:57 +0200
Message-ID: <53BAB6CE-60A5-11D9-8B41-003065C0167C@xslf.com>
References: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com>
 <1105093253.3616.34.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-23062-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <1105093253.3616.34.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On 07/01/2005, at 12:20, Vladimir Saveliev wrote:

> I would move the problem hard disk to mashine which has (or can
> download) latest reiserfsck
> (http://thebsh.namesys.com/pub/reiserfsprogs/reiserfsprogs 
> -3.6.19.tar.gz),
> make sure that it performs I/O of that disk decently (hdparm -t
> /dev/problem-disk) and run reiserfsck --rebuild-tree for broken
> filesystem there.

Thanks for the fast reply.
The only other machine I have here is a Mac running OSX. Would it even  
be possible to do this from a Mac?
If not, can anything be done from a LiveCD?
---
Shoshannah Forbes
http://www.xslf.com

