From: Hans Reiser <reiser@namesys.com>
Subject: Re: Converter program from V3 to V4 ?
Date: Wed, 23 Apr 2003 19:03:00 +0400
Message-ID: <3EA6AB24.6070705@namesys.com>
References: <50020.61.238.161.206.1051113325.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <50020.61.238.161.206.1051113325.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Graham <lkthomas@sml.dyndns.org>
Cc: reiserfs-list@namesys.com

Thomas Graham wrote:

>reiserfs 4 will be release soon, I got almost 90GB data on a HD that is
>using reiserfs3, how could I install v4 on this HD ? would it have a
>converter program to concert from V3 to V4 ? Thanks.
>
>
>  
>
The converter program is called tar.  Maybe someday we will write a 
script to resize partitions incrementally as we copy data from one 
partition to another....

Remember that filesystems take many years to stabilize to where V3 is 
now, and V4 will be flaky when it first ships.  Every bug we know how to 
find will be fixed, but real users find bugs test suites don't.

-- 
Hans


