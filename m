From: "David Boutcher" <boutcher@us.ibm.com>
Subject: Re: [reiserfs-list] Memory Corruption
Date: Sun, 8 Sep 2002 12:51:35 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <OF3896E1D4.0E34D814-ON86256C2E.0061BEB5-86256C2E.00621B7A@rchland.ibm.com>
References: <1030628426.17778.337.camel@tiny>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1030628426.17778.337.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com, Michael Ranweiler <mranweil@us.ibm.com>

                                                                                                                                       
                      Chris Mason                                                                                                      
                      <mason@suse.com>         To:       David Boutcher/Rochester/IBM@IBMUS                                            
                                               cc:       reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org                      
                      08/29/2002 08:40         Subject:  Re: [reiserfs-list] Memory Corruption                                         
                      AM                                                                                                               
                                                                                                                                       
                                                                                                                                       








>On Wed, 2002-08-28 at 17:00, David Boutcher wrote:
>>
>> >On Mon, 2002-08-19 at 12:50, Dave Boutcher wrote:
>> >> Hi,
>> >>
>>> I'm chasing a wierd memory corruption problem on a ppc64 system.  The
>>> first byte of a slab_t structure keeps getting stepped on (zeroed,
>>> actually.)  This happens during a testcase that copies a large file
>>> called "junk" between file systems (a mix of ext2 and reiser) on a
>>> 2.4.13 kernel.  I know that's REALLY REALLY old, but it's whats in
>>> SuSE's SLES-7 release that we have customers running...
>>
>>Any chance the test case involves renames?
>>
>>-chris
>>
>>So I posted my problem with memory corruption a few weeks ago....and the
>>problem turned out to be a REALLY old/moldy set of userland reiser tools.
>>I don't know exactly why that caused memory corruption in the kernel, but
>>updating the tools fixed everything right up.
>Well, that shouldn't fix it ;-)  Which version of reiserfsprogs were you
>running before?
>
>Are the filesystems getting checked during boot at all (you would see
>reiserfsck messages during boot)?

The fixed tools show:
[root@linux102 /root]# reiserfsck -V

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3

The broken tools show:
[root@linux102 /root]# /sbin/reiserfsck.org -V

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1a

[root@linux102 /root]# ls -l /sbin/reiserfsck*
-rwxr-xr-x    1 root     root       719431 Aug 21 10:16 /sbin/reiserfsck*
-rwxr-xr-x    1 root     root       265740 Feb 28  2002
/sbin/reiserfsck.org*
[root@linux102 /root]#
This was Turbolinux...the broken tools are the ones shipped with their 6.5
distribution.

Dave B


