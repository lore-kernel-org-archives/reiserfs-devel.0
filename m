From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: corrupted disk
Date: Tue, 11 Oct 2005 18:10:50 +0400
Message-ID: <434BC7EA.7090905@namesys.com>
References: <200510111602.24857.listuser@peternixon.net> <20051011133104.GA2763@favonius> <200510111634.40710.listuser@peternixon.net> <20051011135522.GB2763@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051011135522.GB2763@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Peter Nixon <listuser@peternixon.net>, reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

Hello

Sander wrote:
> Peter Nixon wrote (ao):
>>On Tuesday 11 October 2005 16:31, Sander wrote:
>>>Peter Nixon wrote (ao):
>>>>At 06:15 this morning the following errors showed up in /var/log/messages
>>>>
>>>>Oct 11 06:15:03 DB2MUHASEBE kernel: kernel BUG at prints.c:334!
>>>>Oct 11 06:15:03 DB2MUHASEBE kernel: invalid operand: 0000 2.4.21-138-smp
>>>>#1 SMP Fri Oct 31 00:51:31 UTC 2003
>>>>
>>>>Oct 11 06:15:03 DB2MUHASEBE kernel: EIP:    0010:[<c5096ec8>]    Tainted:
>>>>P
>>>Your kernel is very, very old and tainted.
>>Yes. I am aware of that. As I mentioned the server is an IBM server running 
>>SUSE Linux Enterprise 8 and DB2. At the time of deployment of the server SLES 
>>9 was not yet certified to run with DB2.
> 
> What I'm trying to say is that you are very unlikely to receive support
> on such an old kernel. And most likely the bug is fixed in a younger
> kernel.
> 
> And, you are also running a tainted kernel. You are less likely to
> receive support on a tainted kernel.
> 
The filesystem should not have been eaten. We can to understand what did happen
with it. Even if kernel managed somehow wipe filesystem superblock out - it
could not (well, it should not) corrupt all the data.
