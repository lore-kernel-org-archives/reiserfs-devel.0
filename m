From: Hans Reiser <reiser@namesys.com>
Subject: Re: write barrier patches for 2.4.21
Date: Wed, 03 Sep 2003 02:10:03 +0400
Message-ID: <3F55153B.1060808@namesys.com>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero> <20030827064103.GA29131@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030827064103.GA29131@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Tue, Aug 26, 2003 at 05:46:24PM -0400, Tom Vier wrote:
>
>  
>
>>anyone working on scsi wb's? there was a long thread on l-k about wb's, but
>>i wasn't aware what came of it.
>>    
>>
>
>There was a discussion about that on Kernel Summit 2003 and general opinion was that SCSI
>does not need the WB stuff at all as it does the correct thing anyway.
>
define "correct thing".

>But since the the barrier flags are visible in io requests, actual device drivers
>are free to do something when met with barrier requests or to ignore it.
>The only concern is probably raid cards that show bunch of IDE drives as a SCSI device.
>
>Bye,
>    Oleg
>
>
>  
>


-- 
Hans


