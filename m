From: Spam <spam@tnonline.net>
Subject: Re: rebuild-tree working for more then 3 days- what to do?
Date: Fri, 7 Jan 2005 13:43:30 +0100
Message-ID: <1332240552.20050107134330@tnonline.net>
References: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com>
 <1105093253.3616.34.camel@tribesman.namesys.com>
 <53BAB6CE-60A5-11D9-8B41-003065C0167C@xslf.com>
 <1105101220.4192.68.camel@tribesman.namesys.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1105101220.4192.68.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> Hello

> On Fri, 2005-01-07 at 15:11, Shoshannah Forbes wrote:
>> On 07/01/2005, at 12:20, Vladimir Saveliev wrote:
>> 
>> > I would move the problem hard disk to mashine which has (or can
>> > download) latest reiserfsck
>> > (http://thebsh.namesys.com/pub/reiserfsprogs/reiserfsprogs
>> > -3.6.19.tar.gz),
>> > make sure that it performs I/O of that disk decently (hdparm -t
>> > /dev/problem-disk) and run reiserfsck --rebuild-tree for broken
>> > filesystem there.
>> 
>> Thanks for the fast reply.
>> The only other machine I have here is a Mac running OSX. Would it even
>> be possible to do this from a Mac?
>> If not, can anything be done from a LiveCD?

> When you boot off liveCD - do you have a network and place where
> reiserfsprogs can be put and compiled besides that 60gb device with
> broken reiserfs?
> Then boot liveCD, download reiserfsprogs and fsck.

  There are liveCD's with reiser4 and reiser4progs. For example: http://lxnay.dnsalias.org/livecd-iso/index.php

  ~S

