From: Jure Pecar <pegasus@nerv.eu.org>
Subject: Re: how long is reiserfsck expected to run?
Date: Sat, 24 May 2003 22:23:24 +0200
Message-ID: <20030524222324.2580002e.pegasus@nerv.eu.org>
References: <200305241131.40837.pegasus@nerv.eu.org>
	<20030524093710.GA15753@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030524093710.GA15753@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sat, 24 May 2003 13:37:10 +0400
Oleg Drokin <green@namesys.com> wrote:


> It can take pretty long time.

It just finished, after about 40h.

2859 found corruptions can be fixed only during --rebuild-tree.

yay. And manual page strongly suggest backing up the partition before
--rebuild-tree. But i neither have 500gb handy nor time to do that ...

Btw, how long is --rebuild-tree going to take? Even longer i guess? :)



Anyway, here's what happened:

I have a 28 fs disks in a raid10, one stripe across 14 mirrors. Disks get
randomly kicked out of mirrors every now and then due to a driver/firmware
issue i'm currently hunting down with qlogic. So on wednesday evening sdh
got kicked out of md8, on early friday morning sdw, the other disk in this
mirror, also started to act. I did a failover to the other box in order to
sort things out, but, the horror, sw raid deceided to take sdh as a more
recent disk than sdw, thus overwriting fresh data on sdw with ~two days old
data from sdh.

I was able to get the stripe together normally, reiserfs mounted without
complains, but it was obvios immediately that something is wrong ... there
were files missing that should be there, touching them returned -EPERM.
Cyrus was complaining about its databases and didnt start ... Then i
unmounted the partition, tried reiserfsck --check, gave up after one hour
and went on with --fix-fixable ... 

Has anyone been through something like this before? Is this fixable
afterall?

Well if it is i think i owe you (the reiserfs team) something ... what do
you prefer? :)


Btw this is on rh AS with their 2.4.9-e16 kernel, based on 2.4.9-ac10. I'd
say that reiserfs code in this kernel is exactly the same as in the Alan's
ac10. I'm using reiserfsprogs 3.6.6.

-- 

Jure Pecar
