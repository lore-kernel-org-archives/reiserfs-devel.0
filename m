From: Yury Umanets <umka@namesys.com>
Subject: Re: quick question
Date: 26 Jul 2003 11:12:35 +0400
Message-ID: <1059203555.21910.5.camel@haron.namesys.com>
References: <1059160120.17256.1065.camel@tfitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15050-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059160120.17256.1065.camel@tfitz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tim fitz <fitzboy@iparadigms.com>
Cc: reiserfs-list@namesys.com

On Fri, 2003-07-25 at 23:08, tim fitz wrote:
> Hi everyone,
> This is Tim Fitz over at iParadigms (www.turnitin.com). We've been doing
> some more playing with reiser and it seems to be running pretty well,
> but every now and then our Dell PERC card seems to throw a tantrum and
> kill the machine. Well either way, we have been happy for a few months
> but now we are in the hole again. The machine is up but on two of our
> partitions we have errors. 

> After running reiserfsck we got the messages
> below. I was wondering if there was any serious worries about trying to
> fix these errors with reiserfsprogs-3.6.10? Anything I should worry
> about? I know the --check happened with older utilities, but I just
> downloaded the 3.6.10... Anything I should worry about? Or is there any
> special thing I should do?

Hello,

I propose you make a backup first. Do you have spare drive of
partrition?

Then run lats fsck on backup in maner like the following:

reiserfsck --rebuild-tree /dev/sdb1

This should fix everything. And let us know the result.


-- 
We're flying high, we're watching the world passes by...

