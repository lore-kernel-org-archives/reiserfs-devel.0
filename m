From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 00:17:47 +0100
Message-ID: <3452483515.20030212001747@tnonline.net>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>> I've used ReiserFS in the past, but have also used ext3 on my
>> user's important
>> data (/home) after a good chunk of one drive was converted to
>> sparse/null files due to a screwup stemming from no 'badblocks' support
>> in reiserfs.  Since then, i've used ext3 as well as Reiser but recently

> I can't comment on your experience, but personally if I have a drive with
> any number of badblocks (which are showing up to the fs layer, not invisibly
> re-mapped by the drive) then I take the drive back and get a replacement, or
> bin the drive.

However,  the FS SHOULD support handling of bad blocks/clusters at the
FS  layer,  even  while running in a production system. Bad blocks can
pop  up  at any give time for no particular reason, and it is at these
times  you  (we) need a strong and reliable filesystem that can handle
and logically remap broken blocks/sectors.

Sure,  a  disk  with physical errors should be replaced, but until you
find out about the error on the drive the FS HAS TO HANDLE these kinds
of problems.

 - Anders



