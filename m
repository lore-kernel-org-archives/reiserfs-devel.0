From: Hans Reiser <reiser@namesys.com>
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output
 error
Date: Wed, 04 Aug 2004 11:11:14 -0700
Message-ID: <411126C2.20007@namesys.com>
References: <20040804174440.534DD15C57@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804174440.534DD15C57@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: "'Vladimir V. Saveliev'" <vs@namesys.com>, reiserfs-list@namesys.com

David Dabbs wrote:

>Something to add regarding the following errors from last night:
>
>cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
>
>As part of my mongo benchmarking, I have added two steps before all other
>processing:
>
>1. Create a large number of directories on the benchmark device. These are
>taken from a list of actual directories on my machine and are created under
>the mount point for the test device e.g. my /etc becomes /mnt/testfs/etc. 
>
>2. Create a large number of files on the test device. This is done using a
>modified version of one of the mongo_ programs. Each file is simply created
>by open(O_CREAT) then closed immediately. I can't tell you how many files
>are created right now because I'm in the middle of running an ext3
>benchmark, but it is a large number of files, each zero length. No shipped
>mongo sources were changed, save mongo.pl (to include the new phases) and an
>added LOG statement so I can watch each iteration command execute.
>
>I spend a long time last night retesting mongo runs with and without the
>MKDIRS and MKFILES phases to see if they had contributed to the errors, but
>could not find any relationship.
>
>I hope this helps in some way.
>
>
>David
>
>
>
>
>
>
>
>  
>
For us to reproduce, we need to have a script of some sort that exactly 
reproduces what you did.

It is especially significant to note such things as whether you might 
have run out of disk space, etc.

It makes a lot of sense that you did not run stock mongo, because elena 
runs that a lot and we likely would have hit the bug already if you had.
