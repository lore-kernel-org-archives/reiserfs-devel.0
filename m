From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 O_DIRECT
Date: Mon, 23 May 2005 10:53:10 -0700
Message-ID: <42921886.40404@namesys.com>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl> <200505222247.j4MMlr85008867@turing-police.cc.vt.edu> <4291225B.5090503@slaphack.com>            <20050523095212.GD11013@nysv.org> <200505231653.j4NGrksq017538@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505231653.j4NGrksq017538@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: =?UTF-8?B?TWFya3VzIO+/vQ==?= <mjt@nysv.org>, David Masover <ninja@slaphack.com>, Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Mon, 23 May 2005 12:52:12 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:
>  
>
>>On Sun, May 22, 2005 at 07:22:51PM -0500, David Masover wrote:
>>    
>>
>>>Of course, I've worked on sufficiently few big projects that I'm still
>>>naive enough to believe that unit tests _can_ catch everything, if
>>>they're done right.  I'm sure I'll eventually be proven wrong...
>>>      
>>>
>>I'm sure a testing professional will happily prove you wrong ;)
>>    
>>
>
>It's *never* the testing professional that disproves "unit tests can catch everything".
>
>It's the guy with the creeping-horror Cobol/Python database that finds the stuff
>that unit tests can't catch.. ;)
>
>  
>
My favorite for version 3 (we now test for this in v4 testing) was
mozilla truncating files longer rather than shorter.  Legal but was not
tested for....

fsx is now the standard file system test tool.  It still misses a LOT of
stuff.

Hans
