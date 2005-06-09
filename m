From: dzosh@nano.cz
Subject: Re: ReiserFS.3 root block problem
Date: Thu, 9 Jun 2005 13:03:09 +0200 (CEST)
Message-ID: <1823.212.80.80.10.1118314989.squirrel@webmail.nano.cz>
References: <1546.212.80.80.10.1118310671.squirrel@webmail.nano.cz>
    <200506091431.41426.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24357-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506091431.41426.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

yes, i know that you have paid support, but im not able , for now, to pay anythin :-/
reiserfsck says this:

---------------------------------------------------------------------------------------
reiserfsck /dev/loop4

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/loop4
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Thu Jun  9 12:58:03 2005
###########
Replaying journal..
0 transactions replayed
Checking S+tree..

Bad root block 0. (--rebuild-tree did not complete)


Aborted
---------------------------------------------------------------------------------------


> On Thursday 09 June 2005 13:51, dzosh@nano.cz wrote:
> 
>> Hi, im newbie w/ mailinglists, this is my 1st, so sorry for mistakes..
>> 
>> 
>> I got problem with my reiserfs partition version 3.x.1b. I have 4x200gb
>> disks. I put it to LVM so i got 800gb LVM.. Then i mkreiserfs system
>> there.. All works ok about 2years, but week ago i got badblocks problem
>> w/ one disk. So i try to check partition, get list of badblocks via
>> debugreiserfs and then fix it. But things goes bad and now im not able
>> to mount this partition.
>> 
>> debugreiserfs shows me Root block: 0 and I think this is bad. Is there
>> any way how to fix filesystem? Im crazy about it, because all data are
>> there, only thing to do is to fix filesystem and mount it :-/
>> 
>> (linux, 2.4.20(debian), reiserfs 3.x.1b, but i try 3.6.19 also, but
>> still the same)
> 
> what does reiserfsck say?
> 
> we handle hardware problems under www.namesys.com/support.html terms.
> 
> --
> Thanks,
> Vitaly Fertman
> 
> 

