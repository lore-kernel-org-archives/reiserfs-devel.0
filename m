From: "Alistair McDonald" <alistair@inrevo.com>
Subject: Re: Bad block 0 error
Date: Mon, 21 Jun 2004 16:19:06 +0100 (BST)
Message-ID: <55895.170.148.92.18.1087831146.squirrel@170.148.92.18>
References: <59446.170.148.10.46.1087810034.squirrel@170.148.10.46>   
    <40D6CB90.7070100@namesys.com>
    <35523.170.148.10.46.1087819828.squirrel@170.148.10.46>
    <40D6D84C.5080408@namesys.com>
Reply-To: alistair@inrevo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40D6D84C.5080408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

>
> Lets try to see if there are reiserfs metadata on /dev/md0:
>
> echo "\n" | 3.6.17/debugreiserfs -k -S -q /dev/md0 | head 10000
>
> It should output something like:
> block 17775 is reiserfs leaf node
>
> If you do not see such lines - reiserfsck can not do anything with that
> device.

Well, it took a *long, long* time, but here are the results (the command
changed slightly):

# echo "\n" | debugreiserfs -k -S -q /dev/md0 | head -10000
head: `-10000' option is obsolete; use `-n 10000' since this will be
removed in
the future
debugreiserfs 3.6.17 (2003 www.namesys.com)

Whole device (61277904 blocks) is to be scanned
looking for ([0 0])
0%...\.20%....40%....60%..
Log file 'scan.log' is opened
What key do you want to find: dirid?objectid?block 16 is reiserfs super block
block 18 is journal descriptor
block 19 is reiserfs super block
block 21 is journal descriptor
block 22 is reiserfs super block
block 24 is journal descriptor
block 25 is reiserfs super block
altair root # \


>
> please also run
> debugreiserfs -m /dev/md0 > md0.bitmap
> and send us md0.bitmap
>

I will send the md0.bitmap directly to you (not to the list) once that
command has completed.

Many thanks,

Alistair



-- 
Alistair McDonald       (+44)(0)7017-467386
http://www.inrevo.com

